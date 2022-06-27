extends Area2D

onready var AnimatedSprite = get_node("AnimatedSprite")
onready var animated_sprite = $AnimatedSprite

func _physics_process(_delta):
	animated_sprite.play("idle")


func _on_FightArea_body_entered(_body):
	if _body.is_in_group("Player"):
		Global.potions = 0
		get_tree().change_scene("res://GameOverScreen.tscn")
	


	
	
