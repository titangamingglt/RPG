extends Node2D
var item_description ={
	"name" : "sowrd",
	"attack" : 10,
	"description" : ""
}
func _ready():
	randomize()
	if randi() % 2 == 0:
		$TextureRect.texture= load("res://Sprite/Main/UI/Inventory/items/wooden_sowrd.png")
		item_description.name = "Wooden Sword"
		item_description.attack = 5
		item_description.description ="Your PrimarySowrd"
	else :
		$TextureRect.texture =load("res://Sprite/Main/UI/Inventory/items/silver_sword.png")
		item_description.name = "Silver Sword"
		item_description.attack = 60
		item_description.description = "A Shining Silver Sword"
	pass
