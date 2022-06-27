extends Area2D

signal potion_collected

func _on_potion_body_entered(body):
	if body.is_in_group("Player"):
		collected()
		
func collected():
	emit_signal("potion_collected")
	Global.potion_collected = true
	queue_free()
