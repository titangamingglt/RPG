extends Panel
var item_scn = preload("res://Scenes/Item.tscn")
var item= null
var item_stat ={}
func _ready():
	randomize()
	if randi() %2 == 0:
		item = item_scn.instance()
		add_child(item)
	pass
func pick_from_slot():
	remove_child(item)
	var inventory = find_parent("Inventory")
	inventory.add_child(item)
	item_stat= item.item_description
	item=null
	pass
	
func put_into_slot(new_item):
	item=new_item
	item.position= Vector2(0,0)
	var inventory = find_parent("Inventory")
	inventory.remove_child(item)
	add_child(item)
	pass
