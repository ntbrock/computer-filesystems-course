# Multiadventure
## Multidaventure is a multiplayer adventure game (as the title may suggest)
## Multiadventure is
 * multiplayer
 * an adventure
 * turing complete
 * fun (possibly)
 * mod compatible

## It's very easy to make a custom Multiadventure world.  Just follow the simple instructions below
 1. go to the `world/` directory
 1. edit or create `[worldname].json`
 1. include the following fields
    1. name (a string that is the name of the world)
    1. data (another object containing the following)
       1. type (containing string "public" or "private")
       1. map (an array of strings that will be the map)
       1. walls (an array of strings containing single character each that represents a wall)

## Here is an example world json file
``` json
{
	"name": "example",
	"data": {
		"type": "public",
		"map": [
			"...........",
			".../\\......",
			"../  \\.....",
			"..| #|.....",
			"..|E_|....."
		],
		"walls": ["/","\\","|","#","_","E"]
	}
}
```
## Oh Yeah you can also make custom character parts

## Problems I ran into
 - [x] Nothing working
 - [x] Read/write conflicts
 - [x] "Collision detection"
 - [x] Turing complete
 - [ ] Bounds toggle from world json

## Ways I can improve in the future
 * Do NOT make it read/write to textfiles the way I did
   * I could fix this by actually writing a server or doing a peer to peer sort of modle
 * Make it more accessible
   * I could fix this by re-writing it in JS with Node or PHP (preferably not PHP) so people could play it in their browsers
 * Make it more fun
   * I dunno how to do that I'm not a game designer
