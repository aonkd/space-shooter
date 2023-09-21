extends Node2D

var Player = load("res://player/player.tscn")

func _physics_process(_delta):
	if get_child_count() == 0:
		var player = Player.instantiate()
		player.position = Vector2(512,300)
		add_child(player)


func _on_timer_timeout():
	pass # Replace with function body.
