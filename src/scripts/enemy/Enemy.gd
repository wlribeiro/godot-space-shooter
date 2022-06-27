extends KinematicBody2D

# constants

# variables
var drop_speed = 200


func _ready():
	$Sprite.rotation_degrees = rand_range(0, 90)


func _physics_process(delta):
	var motion = Vector2()
	motion.y += 1
	motion = motion.normalized() * drop_speed
	motion = move_and_slide(motion)

func destroy_if_left_screen() : 
	pass
	
