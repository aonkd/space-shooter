extends CharacterBody2D

var y_positions = [100,150,200,500,550]
var initial_position = Vector2.ZERO
var direction = Vector2(1.5,0)
var wobble = 30.0
var health = 2
var Bullet = load("res://enemy/enemy_bullet.tscn")
var Explosion = load("res://effects/explosion.tscn")
var Effects = null

func _on_timer_timeout():
	var Player = get_node_or_null("/root/Game/player_container/player")
	Effects = get_node_or_null("/root/Game/effects")
	if Player != null and Effects != null:
		var bullet = Bullet.instantiate()
		var d = global_position.angle_to_point(Player.global_position) + PI/2
		bullet.rotation = d
		bullet.position = global_position + Vector2(0, -40).rotated(d)
		Effects.add_child(bullet)
	

func _ready():
	initial_position.x = -100
	initial_position.y = 500
	position = initial_position

func damage(d):
	health -= d
	if health <= 0:
		Global.update_score(500)
		queue_free()

func _on_area_2d_body_entered(_body):
	if _body.name == "player":
		damage(10)

func _physics_process(_delta):
	position += direction
	position.y = initial_position.y + sin(position.x/20)*wobble
	if position.x > Global.VP.x:
		queue_free()
