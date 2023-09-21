extends Control

var lives_pos = Vector2.ZERO
var lives_index = 30
var Indicator = load("res://ui/indicator.tscn")

func _ready():
	lives_pos.x = 20
	lives_pos.y = Global.VP.y - 20
	update_score()
	update_time()
	update_lives()

func update_score():
	$score.text = "score: " + str(Global.score)

func update_time():
	$time.text = "time: " + str(Global.time)

func update_lives():
	for child in $indicator_container.get_children():
		child.queue_free()
	for i in range(Global.lives):
		var indicator = Indicator.instantiate()
		indicator.position = lives_pos + Vector2(lives_index*i, 0)
		$indicator_container.add_child(indicator)

func _on_timer_timeout():
	Global.time -= 1
	update_time()
	if Global.time <= 0:
		get_tree().change_scene_to_file("res://ui/end_game.tscn")
