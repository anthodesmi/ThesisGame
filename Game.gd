extends Node2D

var potions = 0


func _on_potion_potion_collected():
	potions = potions + 1
	var PotionLabel = String(potions)
	Global.potions += 1



