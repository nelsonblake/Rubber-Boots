extends Node2D


# Declare member variables here. Examples:
var timer = Timer.new()
var timer2 = Timer.new()
var animation = null
var textFlag = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Fade2.play("FadeIn")
	animation = $TextPop2.get_animation_list()[0]
	if Main.hasKeys == true:
		$TextEdit.hide()

func get_input(_delta):
	if $Fade2.get_current_animation() != "FadeIn":
		if Input.is_action_pressed("ui_accept") and textFlag == false:
			$TextPop2.play("TextPop2")
			textFlag = true
			Main.hasKeys = true
			
func _physics_process(delta):
		get_input(delta)

func _on_TextPop2_animation_finished(animation):
	timer.connect("timeout", self, "onTimeout") 
	add_child(timer)
	timer.set_wait_time(2)
	timer.set_one_shot(true)
	timer.start()
	
func onTimeout():
	$TextPop2.play("fadeOut")
	$Fade2.play_backwards("FadeIn")
	timer2.connect("timeout", self, "onTimeout2") 
	add_child(timer2)
	timer2.set_one_shot(true)
	timer2.start()

func onTimeout2():
	$TextPop2.stop(false)
	get_tree().change_scene("res://Scenes/Underpass/UnderpassStart.tscn")


