extends Node
signal item_add
func _add_to_inventorty(item):
	emit_signal("item_add",item)
