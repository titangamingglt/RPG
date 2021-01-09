extends GridContainer

func _ready():
	GlobalInventory.connect("item_add",self,"_add_item")
	pass
func _add_item(item_scene):
	var itm = load(item_scene).instance()
	for i in get_children():
		if i.get_child_count()==0:
			i.item=itm
			i.call_deferred("add_child",i.item)
			i.item.get_node("number").visible=true
			break
		elif i.get_child_count() !=0:
			if i.item.id == itm.id:
				i.item.number+=1
				break
		
