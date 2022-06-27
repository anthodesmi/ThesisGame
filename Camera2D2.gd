extends Camera2D

onready var player = get_parent().get_node("player")

onready var Timer = get_parent().get_node("Timer")
onready var time_label = get_node("time_label")




func _physics_process(delta):
	position.x = player.position.x
	time_label.text = String($Timer.time_left)
	var time = $Timer.time_left
	if time == 0 :
		if Global.potions == 7 :
			get_tree().change_scene("res://WinnigScreen.tscn")
		else:
			Global.potions = 0
			get_tree().change_scene("res://GameOverScreen.tscn")
		
	
	
