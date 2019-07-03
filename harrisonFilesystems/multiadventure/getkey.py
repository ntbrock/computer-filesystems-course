from asciimatics.screen import Screen

def go(screen):
    while 1:
        key = screen.get_event()
        if key:
            screen.clear()
            screen.print_at(str(key.key_code), 0, 0)
            if key.key_code == -1:
                break

        screen.refresh()

Screen.wrapper(go)
