from time import sleep
import json
from os import listdir
from os.path import isfile, join
import atexit
import pip
import os
from pip._internal import main as dang

try:
    import asciimatics
    from asciimatics.screen import Screen
except:
    dang(['install', 'asciimatics'])
    print("RE-RUN SCRIPT")

def login(username, password):
    error = "success"
    try:
        with open('users/' + username + '.json') as f:
            user = json.load(f)
            if password != user['password']:
                error = "incorrect password"
    except:
        error = "user \"" + username + "\" does not exist"
    return error

def signup(username, password):
    error = "success"
    try:
        user = open('users/' + username + '.json')
        error = "user \"" + username + "\" already exists"
    except:
        with open('users/' + username + '.json', 'w+') as f:
            json.dump({"username": username, "password": password}, f)
    return error

def getUsersOnWorld(world):
    userFiles = [f for f in listdir('users') if isfile(join('users/', f))]
    users = []
    try:
        for userFile in userFiles:
            with open('users/'+userFile) as f:
                data = json.load(f)
                try:
                    if data['world'] == world:
                        users.append(userFile.replace('users/','').replace('.json',''))
                except:
                    None
    except:
        None
    return users

def logInScreen(screen):
    global nextScreen, localUser
    running = True
    username = ""
    password = ""
    errorMessage = ""
    selected = 0
    while running:
        key = screen.get_event()
        if key:
            try:
                char = chr(key.key_code)
                if key.key_code in [10, 13]:
                    if selected == 2:
                        errorMessage = login(username, password)
                        if errorMessage == "success":
                            localUser = username
                            running = False
                    elif selected == 3:
                        errorMessage = signup(username, password)
                        if errorMessage == "success":
                            localUser = username
                            nextScreen = 'characterSelection'
                            running = False
                elif selected == 0:
                    username += char
                    if len(username) > 12:
                        username = username[:12]
                elif selected == 1:
                    password += char
                    if len(password) > 12:
                        password = password[:12]
            except:
                if key.key_code == -301: # tab
                    selected += 1
                    selected %= 4
                if key.key_code == -300: #backspace
                    if selected == 0:
                        username = username[:len(username)-1]
                    elif selected == 1:
                        password = password[:len(password)-1]
                if key.key_code in [10, 13]: # enter
                    None
        screen.clear()
        screen.print_at(errorMessage, 20, 5, 1)
        screen.print_at('username:', 20, 10)
        screen.print_at(username, 29, 10)
        screen.print_at('password:', 20, 15)
        screen.print_at("*" * len(password), 29, 15)
        screen.print_at('log in', 30, 20)
        screen.print_at('sign up', 40, 20)
        if selected == 0:
            color = 7
            if len(username) == 12:
                color = 1
            screen.print_at('_', 29 + len(username), 10, color)
        elif selected == 1:
            color = 7
            if len(password) == 12:
                color = 1
            screen.print_at('_', 29 + len(password), 15, color)
        elif selected == 2:
            screen.print_at('>', 29, 20)
        elif selected == 3:
            screen.print_at('>', 39, 20)
        screen.refresh()
        sleep(.075)

def createCharacterScreen(screen):
    global localUser
    running = True
    parts = [
        ["hats", 0],
        ["faces", 0],
        ["arms", 0],
        ["legs", 0]
    ]
    selected = 0
    while running:
        key = screen.get_event()
        if key:
            if key.key_code == -206:
                selected += 1
                selected %= 5
            elif key.key_code == -204:
                selected -= 1
                selected = abs(selected % 5)
            elif key.key_code in [-205, -203] :
                partsData = []
                try:
                    with open('charData/' + parts[selected][0] + '.json') as f:
                        partsData = json.load(f)
                    parts[selected][1] += 1 if key.key_code == -205 else -1
                    parts[selected][1] %= len(partsData)
                except:
                    None
            elif key.key_code in [10, 13] and selected == 4:
                try:
                    with open('users/' + localUser + '.json') as f:
                        player = json.load(f)
                        player["hat"] = parts[0][1]
                        player["face"] = parts[1][1]
                        player["body"] = parts[2][1]
                        player["legs"] = parts[3][1]
                        with open('users/' + localUser + '.json', 'w') as g:
                            json.dump(player, g)
                    running = False
                except:
                    None
        screen.clear()
        for num, item in enumerate(parts):
            with open('charData/'+item[0]+'.json') as f:
                data = json.load(f)
                part = data[item[1]].split('\n')
                for index, section in enumerate(part):
                    if num == 1:
                        screen.print_at(section, 10, index + (num * 4) + 4)
                    else:
                        screen.print_at(section, 9, index + (num * 3) + 4)
        screen.print_at("Hat: " + str(parts[0][1]), 25, 8)
        screen.print_at("Face: " + str(parts[1][1]), 25, 10)
        screen.print_at("Body: " + str(parts[2][1]), 25, 12)
        screen.print_at("Legs: " + str(parts[3][1]), 25, 14)
        screen.print_at('Done', 25, 16)
        if selected == 0:
            screen.print_at(">", 24, 8)
        elif selected == 1:
            screen.print_at('>', 24, 10)
        elif selected == 2:
            screen.print_at('>', 24, 12)
        elif selected == 3:
            screen.print_at('>', 24, 14)
        elif selected == 4:
            screen.print_at('>', 24, 16)
        screen.refresh()
        sleep(.075)

def worldSelect(screen):
    global localUser
    running = True
    world = ""
    errorMessage = ""
    while running:
        key = screen.get_event()
        if key:
            try:
                char = chr(key.key_code)
                if key.key_code in [10, 13]:
                    try:
                        with open('worlds/'+world+'.json') as f:
                            data = json.load(f)
                            if data['data']['type'] == 'public':
                                errorMessage = "success"
                                with open('users/'+localUser+'.json') as g:
                                    pData = json.load(g)
                                    pData['world'] = world
                                    pData['x'] = 0
                                    pData['prevx'] = 0
                                    pData['y'] = 0
                                    pData['prevy'] = 0
                                    with open('users/'+localUser+'.json','w') as l:
                                        json.dump(pData, l)
                                running = False
                            else:
                                errorMessage = "cannot join private world"
                    except:
                        errorMessage = 'could not find world "' + world + '"'
                else:
                    world += char
            except:
                if key.key_code == -300:
                    world = world[:len(world)-1]
        screen.clear()
        screen.print_at(errorMessage, 30, 10, 1)
        screen.print_at("world:", 30, 12)
        screen.print_at('_', 36 + len(world), 12)
        screen.print_at(world, 36, 12)
        screen.refresh()
        sleep(.075)

def runCommand(command):
    global localUser
    print(command)
    print(command[:2] + 'short')
    if command[:3] == 'say':
        text = command[4:]
        print(text)
        try:
            with open('users/'+localUser+'.json') as f:
                pData = json.load(f)
                with open('chat/'+pData['world']+'.chat', 'a') as g:
                    g.write(localUser+': '+text+'\n')
        except:
            None
    if command[:4] == 'exec':
        text = command[5:]
        exec(text)
def worldScreen(screen):
    global localUser
    running = True
    console = False
    command = ''
    while running:
        try:
            pData = {}
            with open('users/'+localUser+'.json') as f:
                pData = json.load(f)
            key = screen.get_event()
            if key:
                if key.key_code in [-206, -204, -205, -203]:
                    pData['prevy'] = pData['y']
                    pData['prevx'] = pData['x']
                if key.key_code == -206:
                    pData['prevy'] = pData['y']
                    pData['y'] += 1
                elif key.key_code == -204:
                    pData['prevy'] = pData['y']
                    pData['y'] -= 1
                elif key.key_code == -205:
                    pData['prevx'] = pData['x']
                    pData['x'] += 1
                elif key.key_code == -203:
                    pData['prevx'] = pData['x']
                    pData['x'] -= 1
                elif key.key_code == -1:
                    running = False
                elif key.key_code == 47 and not console:
                    console = True
                elif key.key_code in [10, 13] and console:
                    runCommand(command)
                    command = ''
                    console = False
                elif console and key.key_code > 0:
                    try:
                        command += chr(key.key_code)
                    except:
                        None
                elif console and key.key_code == -300:
                    command = command[:len(command)-1]
            with open('worlds/'+pData['world']+'.json') as f:
                data = json.load(f)
                wMap = data['data']['map']
                try:
                    if data['data']['bounds'] == "true":
                        if pData['y'] > len(wMap) -1:
                            pData['y'] = len(wMap) -1
                            pData['prevy'] = pData['y']
                        if pData['y'] < 0:
                            pData['y'] = 0
                            pData['prevy'] = pData['y']
                        if pData['x'] > len(wMap[pData['y']])-1:
                            pData['x'] = len(wMap[pData['y']])-1
                            pData['prevx'] = pData['x']
                        if pData['x'] < 0:
                            pData['x'] = 0
                            pData['prevx'] = pData['x']
                except:
                    None
                try:
                    walls = data['data']['walls']
                    if wMap[pData['y']][pData['x']] in walls:
                            pData['y'] = pData['prevy']
                            pData['x'] = pData['prevx']
                except: 
                    None
            with open('users/'+localUser+'.json', 'w') as f:
                json.dump(pData, f)
            screen.clear()
            screen.print_at('Logged in as', 0, 0)
            screen.print_at(localUser, 13, 0, 3)
            screen.print_at('Current world', 0, 1)
            screen.print_at(pData['world'], 14, 1, 2)
            users = getUsersOnWorld(pData['world'])
            screen.print_at('-' * 67, 0, 2)
            screen.print_at(str(len(users)) + " active", 68, 0)
            for i in range(40):
                screen.print_at('|', 67, i)
            pData = {}
            with open('users/'+localUser+'.json') as f:
                pData = json.load(f)
            wData = {}
            with open('worlds/'+pData['world']+'.json') as f:
                wData = json.load(f)
            for index, row in enumerate(wData['data']['map']):
                end = 33+pData['x']
                if end > len(row):
                    end = len(row)
                y = 12-pData['y']+index
                if y < 3:
                    y = -1
                screen.print_at(row[:end], 33-pData['x'], y)
            for index, user in enumerate(users):
                if user == localUser:
                    color = 3
                else:
                    color = 5
                with open('users/'+user+'.json') as f:
                    data = json.load(f)
                    if data['x'] == pData['x'] and data['y'] == pData['y'] and user != localUser:
                        screen.print_at(user, 68, 1+index, color)
                    if color == 3:
                        screen.print_at('@', 33, 12, color)
                    else:
                        screen.print_at('@', 33+data['x']-pData['x'],12+data['y']-pData['y'], color)
            if console:
                screen.print_at('-'*90,0, 22)
                screen.print_at(' '*90, 0, 23)
                screen.print_at('/', 0, 23)
                screen.print_at(command, 1, 23)
            try:
                with open('chat/'+pData['world']+'.chat') as f:
                    lines = [x for x in f.readlines()]
                    line = lines[len(lines)-1]
                    line = line[:len(line)-1]
                    if len(line) > 67:
                        line = line[:67]
                    screen.print_at('-'*67, 0, 4)
                    screen.print_at(' '*67, 0, 3)
                    if line.split(':')[0] == localUser:
                        color = 3
                    else:
                        color = 5
                    screen.print_at(line, 0, 3, color)
            except:
                None
            screen.refresh()
            sleep(.075)
        except:
            None
nextScreen = 'worldSelect'
localUser = {}
def main():
    global nextScreen, localUser
    Screen.wrapper(logInScreen)
    if nextScreen == 'characterSelection':
        Screen.wrapper(createCharacterScreen)
    Screen.wrapper(worldSelect)
    Screen.wrapper(worldScreen)

def exit():
    global localUser
    with open('users/'+localUser+'.json') as f:
        data = json.load(f)
        if data['world']:
            with open('users/'+localUser+'.json', 'w') as g:
                data['world'] = False
                json.dump(data, g)
    print('ending')

atexit.register(exit)

if __name__ == '__main__':
    try:
        main()
        
    except KeyboardInterrupt:
        exit()
