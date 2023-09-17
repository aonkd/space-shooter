extends AnimatedSprite2D


func _ready():
	play("explosion_animation")
	
	
func _on_animation_finished():
	queue_free()
