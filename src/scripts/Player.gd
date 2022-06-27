extends KinematicBody2D


var mouse_location

var Motion = Vector2()

onready var sprite_animation = $AnimatedSprite
const ANIMATIONS = {
	'stay': 'default',
	'left': 'left',
	'right': 'right'
}

var animation_state
var ultimate_x_position = position.x

func _ready():
	pass


func _physics_process(delta):
	move()
	handle_animation_state()
	Motion = move_and_slide(position)


func move():
	mouse_location = get_viewport().get_mouse_position()
	position.x = mouse_location.x
	
	position.y = mouse_location.y

func handle_animation_state() :
	var animation
	if position.x == ultimate_x_position :
		animation = ANIMATIONS['stay']
		print('stay')
	
	elif position.x < ultimate_x_position :
		animation = ANIMATIONS['left']
		print('left')		
		
	elif position.x > ultimate_x_position :
		animation = ANIMATIONS['right']
		print('right')
		
	ultimate_x_position = position.x
	sprite_animation.play(animation)

func get_position():
	return position
