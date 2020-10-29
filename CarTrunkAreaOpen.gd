extends Area2D

var timer = Timer.new()

func _ready():
	#connects the animation_finished emitted by the Fade animation to the func onFadeOutFinish
	$Fade.connect("animation_finished", self, "onFadeOutFinish")
	
func get_input(_delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		#if the player is inside the area near the deer and press accept, it will fade out and change scenes
			if body.name == "Player" and Input.is_action_pressed("ui_accept"):
				if $Fade.get_current_animation_length() == 0:
					$Fade.play("fade")

#Starts a timer for after the animation finishes
func onFadeOutFinish(_ani):
	timer.connect("timeout", self, "onTimeout") #connects timer timout to func _on_timer_timeout
	add_child(timer)
	#timer.set_wait_time(0)
	timer.set_one_shot(true)
	timer.start()

#call to change the scene upon timer timeout
func onTimeout():
	changeScene()
	
# Function to change scene, just replace Deer with whatever scene
func changeScene():
	Main.TrunkIsOpen = true
	get_tree().change_scene("res://Scenes/CarTrunkOpen.tscn")
		
func _physics_process(delta):
	get_input(delta)
		
