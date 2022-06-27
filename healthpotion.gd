extends Area2D

signal update_counter
export(int) var potion_value

func _on_potion_body_entered(body):
	hide()
	emit_signal("hit")
	emit_signal('update_counter', potion_value)



