extends Node2D

onready var playerPosition = get_node("/root/Game/Underpass/Player")

func _ready():
	$IntroFade.play("introFade")
	if Main.hasKeys == false:
		$LightsBlink.play("LightsBlink")
	else:
		$CarLightLeft.hide()
		$CarLightRight.hide()
	playerPosition.set_global_position(Main.spawnLocation)
	
#func _process(delta):
	

