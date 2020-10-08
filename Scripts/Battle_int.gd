extends Area2D
var player_type= ["res://Scenes/battle_player.tscn","res://Scenes/battle_player_2.tscn"]
var enemy_type = ["res://Scenes/Battle_enemy.tscn","res://Scenes/Battle_enemy2.tscn"]
func _ready():
	pass


func _on_Battle_int_area_entered(area):
	if area.is_in_group("player"):
		GlobalBattle._update_battle_system(2,2,enemy_type,player_type)
		
