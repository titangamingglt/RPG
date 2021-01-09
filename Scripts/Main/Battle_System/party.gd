extends HBoxContainer

var player
export(int,1,3) var max_party=3
var child_postion_x = 0
func _ready():
	for i in GlobalBattle.party_number:
		player = load(GlobalBattle.player_type[i])
		print(player)
		var plyr = player.instance()
		plyr.position.x=child_postion_x
		add_child(plyr)
		child_postion_x+=100
		plyr.get_node("player_image").connect("pressed",self,"_selection")
	get_child(0).selected =true
func _selection():
	for i in get_children():
		if i.selected ==true:
			i.selected = false
