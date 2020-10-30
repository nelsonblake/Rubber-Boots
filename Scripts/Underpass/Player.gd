extends KinematicBody2D

var speed = 35  # speed in pixels/sec
var velocity = Vector2.ZERO
var screen_size # size of the game window
var inside = false
var action = false

func _ready():
	screen_size = get_viewport_rect().size
	
func get_input(delta):
	velocity = Vector2.ZERO # the player's movement vector
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$AnimationPlayer.play("side")
		$Sprite.set_flip_h( false )
	elif Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		$AnimationPlayer.play("side")
		$Sprite.set_flip_h( true )
	elif Input.is_action_pressed('ui_down'):
		velocity.y += 1
		$AnimationPlayer.play("down")
	elif Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		$AnimationPlayer.play("up")
	
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed
	
	#stop animation if not moving
	if velocity.length() == 0:
		$AnimationPlayer.stop()
		
	# Clamp makes it so the player cannot leave the screen
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity)
	Main.spawnLocation = self.get_global_position()


