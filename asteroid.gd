extends CharacterBody2D

var initial_speed = 30.0

func _ready():
	velocity = Vector2(0,randf()*initial_speed).rotated(randf()*2*PI)

func _physics_process(_delta):

	position.x = wrapf(position.x, 0, 1152)
	position.y = wrapf(position.y, 0, 648)

	move_and_slide()
