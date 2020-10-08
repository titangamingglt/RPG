extends Area2D
var player_type= ["res://Scenes/Level_One/Battle_Player/battle_player.tscn"]
var enemy_type = ["res://Scenes/Level_One/Battle_enemy/Battle_enemy.tscn"]
func _ready():
	pass


func _on_Battle_int_area_entered(area):
	if area.is_in_group("player"):
		GlobalBattle._update_battle_system(1,1,enemy_type,player_type)
		
