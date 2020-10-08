extends Node2D

const SlotClass = preload("res://Scripts/Slot.gd")
onready var inventory_slots =$TabContainer/Attack/GridContainer
var holding_item = null
var opened =false
onready var stat_bar =$Stat
var item_stat = {
	"name" : "",
	"attack" : 0
}
func _ready():
	visible =false
	
	for inv_slot in inventory_slots.get_children():
		inv_slot.connect("gui_input", self, "slot_gui_input",[inv_slot])

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item: # Place holding item to slot
					slot.put_into_slot(holding_item)
					holding_item = null
				else: # Swap holding item with item in slot
					var temp_item = slot.item
					slot.pick_from_slot()
					temp_item.global_position = event.global_position
					slot.put_into_slot(holding_item)
					holding_item = temp_item
			elif slot.item:
				holding_item = slot.item
				slot.pick_from_slot()
				holding_item.global_position = get_global_mouse_position()
			if slot.item_stat != null and !slot.item_stat.empty():
				item_stat= slot.item_stat
				stat_display()
func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()
	if event.is_action_pressed("inventory") and !holding_item:
		if opened:
			visible=false
			opened =false
		else :
			opened = true
			visible=true
func stat_display():
	print(item_stat)
	stat_bar.get_node("name").text=str(item_stat.name)
	stat_bar.get_node("attack").text= "attack" + "=" +str(item_stat.attack)
	stat_bar.get_node("Desc").text=str(item_stat.description)

