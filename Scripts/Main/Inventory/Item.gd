extends Area2D

signal add_to_inventory
var id = 1
var number= 1
var item_description ={
	"name" : "Wooden Sword",
	"attack" : 10,
	"description" : "Your PrimarySowrd"
}

func _process(delta):
	$number.text=str(number)

func _on_Item_area_entered(area):
	if area.is_in_group("player"):
		GlobalInventory._add_to_inventorty("res://Scenes/Main/Inventory/Item.tscn")
		queue_free()
