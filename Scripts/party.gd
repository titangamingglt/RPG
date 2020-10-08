extends HBoxContainer

onready var player = preload("res://Scenes/battle_player.tscn")
export(int,1,3) var max_party=3

func _ready():
	for i in max_party:
		var plyr = player.instance()
		add_child(plyr)
		plyr.get_node("player_image").connect("pressed",self,"_selection")
	get_child(0).selected =true
func _selection():
	for i in get_children():
		if i.selected ==true:
			i.selected = false
