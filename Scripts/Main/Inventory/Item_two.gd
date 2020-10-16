extends Area2D

signal add_to_inventory
var id = 2
var number= 1
var item_description ={
	"name" : "Silver Sword",
	"attack" : 60,
	"description" : "A Shining Silver Sword"
}

func _process(delta):
	$number.text=str(number)



func _on_Item_area_entered(area):
	if area.is_in_group("player"):
		GlobalInventory._add_to_inventorty("res://Scenes/Main/Inventory/Item_two.tscn")
		queue_free()
