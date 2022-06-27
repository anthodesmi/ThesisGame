extends KinematicBody2D

onready var sprite = get_node("AnimatedSprite")
onready var _animated_sprite = $AnimatedSprite
var screensize = Vector2()
var isAttacking = false 

const GRAVITY = 5.0
const WALK_SPEED = 1
const MAX_SPEED = 200

var velocity = Vector2()



func ready():
	screensize = get_viewport_rect().size
	Global.Player = self

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		_animated_sprite.play("walk")
		velocity.x -= WALK_SPEED * 2
	elif Input.is_action_pressed("ui_right"):
		_animated_sprite.play("walk")
		velocity.x +=  WALK_SPEED * 2
	elif Input.is_action_pressed("ui_up"):
		_animated_sprite.play("fly")
		velocity.y -= WALK_SPEED
		if Input.is_action_pressed("ui_select"):
			_animated_sprite.play("flyattack")
	elif Input.is_action_pressed("ui_down"):
		_animated_sprite.play("fly")
		velocity.y += WALK_SPEED
		if Input.is_action_pressed("ui_select"):
			_animated_sprite.play("flyattack")
	elif Input.is_action_pressed("ui_accept"):
		_animated_sprite.play("attack")
		isAttacking = true
	else:
		velocity.x = 0
		_animated_sprite.play("idle")
	

		
		
	velocity.x = clamp(velocity.x, -MAX_SPEED, MAX_SPEED)
	velocity.y = clamp(velocity.y, -MAX_SPEED, MAX_SPEED)
	var position = Vector2()
	position += velocity * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

	
	move_and_slide(velocity, Vector2(0, -1))
	
	if velocity.x > 0:
		sprite.set_flip_h(false)
	elif velocity.x < 0:
		sprite.set_flip_h(true)



