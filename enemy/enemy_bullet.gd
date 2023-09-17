extends Area2D

var speed = 8
var damage = 1
var velocity = Vector2.ZERO
var Effects = null
var Explosion = load("res://effects/explosion.tscn")

func _ready():
	velocity = Vector2(0,-speed).rotated(rotation)

func _process(_delta):
	position = position + velocity


func _on_body_entered(_body):
	if _body.has_method("damage"):
		_body.damage(damage)
	Effects = get_node_or_null("/root/Game/effects")
	if Effects != null:
		var explosion = Explosion.instantiate()
		Effects.add_child(explosion)
		explosion.global_position = global_position
	queue_free()

func _on_timer_timeout():
	queue_free()
