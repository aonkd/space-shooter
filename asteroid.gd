extends CharacterBody2D

var initial_speed = 30.0
var health = 1


func _ready():
	velocity = Vector2(0,randf()*initial_speed).rotated(randf()*2*PI)

func _physics_process(_delta):

	position.x = wrapf(position.x, 0, Global.VP.x)
	position.y = wrapf(position.y, 0, Global.VP.y)

	move_and_slide()

func damage(d):
	health -= d
	if health <= 0:
		Global.update_score(100)
		queue_free()
