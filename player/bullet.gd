extends Area2D

var speed = 10
var damage = 1
var velocity = Vector2.ZERO

func _ready():
	velocity = Vector2(0,-speed).rotated(rotation)

func _process(_delta):
	position = position + velocity


func _on_timer_timeout():
	queue_free()

func _on_body_entered(_body):
	queue_free()
