extends Node2D


#flag that will be used for changing scenes upon obtaining the keys from the car
#until we have the keys we must loop the scene when trying to leave
var hasKeys = false
#flag for if the trunk is open
var TrunkIsOpen = false
#currentExit can be anything that prompts a scene change. ex. deer, car, door, east, west, etc.
var currentExit = null
#location where the player should be
var spawnLocation = Vector2(291,517)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

