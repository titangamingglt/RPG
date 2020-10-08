extends Node
var player_turned = true
var player_type = ["res://Scenes/Level_One/Battle_Player/battle_player.tscn"]
var enemy_number : int = 1
var party_number : int =1
var enemy_type = ["res://Scenes/Level_One/Battle_enemy/Battle_enemy.tscn"]
var player_damage : int = 20
var enemy_damage : int = 0

func _update_battle_system(enem_num,party_num, enem_type = enemy_type, plyr_type = player_type):
	enemy_number = enem_num
	party_number = party_num
	player_type = plyr_type
	enemy_type = enem_type
	
