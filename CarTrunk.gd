extends Node2D


# Declare member variables here. Examples:
var timer = Timer.new()
var timer2 = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Fade.connect("animation_finished", self, "onTimeout2")
	timer.set_one_shot(true)
	timer.set_wait_time(5)
	timer.connect("timeout", self, "onTimeout")
	add_child(timer)
	timer.start()
	$Fade.play("FadeIn")

func onTimeout():
	$Fade.play_backwards("FadeIn")
	timer.set_one_shot(true)
	timer.set_wait_time(2)
	timer.connect("timeout", self, "onTimeout2")
	add_child(timer)
	timer.start()

func onTimeout2():
	get_tree().change_scene("res://Scenes/UnderpassStart.tscn")
