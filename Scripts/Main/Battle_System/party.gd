extends HBoxContainer

onready var player = preload("res://Scenes/Level_One/Battle_Player/battle_player.tscn")
export(int,1,3) var max_party=3

func _ready():
	for i in GlobalBattle.party_number:
		player = load(GlobalBattle.player_type[i])
		print(player)
		var plyr = player.instance()
		add_child(plyr)
		plyr.get_node("player_image").connect("pressed",self,"_selection")
	get_child(0).selected =true
func _selection():
	for i in get_children():
		if i.selected ==true:
			i.selected = false
