extends Node2D


# Declare member variables here. Examples:
var timer = Timer.new()
var timer2 = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Fade.connect("animation_finished", self, "onTimeout2")
	timer.set_one_shot(true)
	timer.set_wait_time(3)
	timer.connect("timeout", self, "onTimeout")
	add_child(timer)
	timer.start()
	$Fade.play("FadeIn")

func onTimeout():
	$Fade.play_backwards("FadeIn")
	timer2.set_one_shot(true)
	timer2.set_wait_time(1)
	timer2.connect("timeout", self, "onTimeout2")
	add_child(timer2)
	timer2.start()

func onTimeout2():
	get_tree().change_scene("res://Scenes/UnderpassStart.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func get_input(delta):

#func _physics_process(delta):
#		get_input(delta)
