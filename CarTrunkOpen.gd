extends Node2D


# Declare member variables here. Examples:
var timer = Timer.new()
var timer2 = Timer.new()
var timer3 = Timer.new()
var timer4 = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready(): 
	if Main.TrunkIsOpen == true:
		$Fade.play("FadeIn")
		$TextEdit.hide()
		timer.set_one_shot(true)
		timer.set_wait_time(3)
		timer.connect("timeout", self, "onTimeout")
		add_child(timer)
		timer.start()
	else:
		$TrunkOpen.play("unlockTrunk")
		$TrunkOpen.connect("animation_finished", self, "onTimeout")
		timer.set_one_shot(true)
		timer.set_wait_time(3)
		timer.connect("timeout", self, "onTimeout")
		add_child(timer)
		timer.start()

func onTimeout():
		$TextEdit.hide()
		timer2.set_one_shot(true)
		timer2.set_wait_time(1)
		timer2.connect("timeout", self, "onTimeout2")
		add_child(timer2)
		timer2.start()

func onTimeout2():
	$TextEdit.set_text("")
	$TextEdit.show()
	$TrunkEmpty.play("TrunkEmpty")
	timer3.set_one_shot(true)
	timer3.set_wait_time(2)
	timer3.connect("timeout", self, "onTimeout3")
	add_child(timer3)
	timer3.start()
	
func onTimeout3():
	$Fade.play("FadeOut")
	timer4.set_one_shot(true)
	timer4.set_wait_time(1)
	timer4.connect("timeout", self, "onTimeout4")
	add_child(timer4)
	timer4.start()
	
func onTimeout4():
	Main.TrunkIsOpen = true
	get_tree().change_scene("res://Scenes/UnderpassTrunkOpen.tscn")
