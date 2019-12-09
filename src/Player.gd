extends KinematicBody2D

const SPEED = 400
const GRAVITY = 20
const JUMP_POWER = -700
const FLOOR = Vector2(2, -1)

var velocity = Vector2()

signal die

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false;
		velocity.x = SPEED
		$AnimatedSprite.play('walk')
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true;
		$AnimatedSprite.play('walk')
	else:
		velocity.x = 0
		$AnimatedSprite.play('idle')
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_POWER
		
	velocity.y += GRAVITY
	
	velocity = move_and_slide(velocity, FLOOR)