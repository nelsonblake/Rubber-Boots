extends Node2D


# Declare member variables here. Examples:
var timer = Timer.new()
var timer2 = Timer.new()
var animation = null
var textFlag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Fade.play("FadeIn")
	$Lights.play_backwards("fadeOut")
	animation = $TextPop.get_animation_list()[0]

func get_input(_delta):
	if $Fade.get_current_animation() != "FadeIn":
		$Lights.play("Lights")
		if Input.is_action_pressed("ui_accept") and textFlag == false:
			$TextPop.play("TextPop")
			textFlag = true
			
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
	timer2.connect("timeout", self, "onTimeout2") 
	add_child(timer2)
	timer2.set_one_shot(true)
	timer2.start()

func onTimeout2():
	$Lights.stop(false)
	$TextPop.stop(false)
	get_tree().change_scene("res://Scenes/UnderpassStart.tscn")


