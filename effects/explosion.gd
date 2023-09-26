extends AnimatedSprite2D


func _ready():
	var Explosion_sound = get_node_or_null("/root/Game/explosion_sound")
	if Explosion_sound != null:
		Explosion_sound.play()
	play("explosion_animation")
	
	
func _on_animation_finished():
	queue_free()
