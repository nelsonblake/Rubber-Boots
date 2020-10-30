extends Node2D


# Declare member variables here. Examples:
var timer = Timer.new()
var timer2 = Timer.new()
var animation = null
#Stops the player from spamming enter to repeat the textbox animation
var textFlag = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Fade.play("FadeIn")
	$Lights.play_backwards("fadeOut")
	animation = $TextPop.get_animation_list()[0]
	var textFlag = false 

func get_input(_delta):
	if $Fade.get_current_animation() != "FadeIn" and Main.hasKeys == false:
		$Lights.play("Lights")
	elif $Fade.get_current_animation() != "FadeIn" and Main.hasKeys == true:
		$Left.hide()
		$Right.hide()
	if Input.is_action_pressed("ui_accept") and textFlag == false and Main.hasKeys == false:
		$TextPop.play("TextPop")
		textFlag = true
	if Input.is_action_pressed("ui_accept") and textFlag == false and Main.hasKeys == true:
		textFlag == true
		get_tree().change_scene("res://Scenes/Underpass/CarTrunkOpen.tscn")
			
func _physics_process(delta):
		get_input(delta)


func _on_TextPop_animation_finished(animation):
	timer.connect("timeout", self, "onTimeout") 
	add_child(timer)
	timer.set_wait_time(2)
	timer.set_one_shot(true)
	timer.start()
	
func onTimeout():
	$Lights.play("fadeOut")
	$TextPop.play("fadeOut")
	$Fade.play_backwards("FadeIn")
	timer2.connect("timeout", self, "onTimeoutTimeout") 
	add_child(timer2)
	timer2.set_one_shot(true)
	timer2.start()

func onTimeoutTimeout():
	$Lights.stop(false)
	$TextPop.stop(false)
	if Main.hasKeys == false:
		get_tree().change_scene("res://Scenes/Underpass/UnderpassStart.tscn")




