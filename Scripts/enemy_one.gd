extends Position2D
onready var select_bar =$Selected_Icon
var enemy 
var child_counting = true
export var selected =false
#func _input(event):
#	if event.is_action_pressed("ui_select"):
#		print(get_children())
#func _ready():
#		enemy=get_children()
#		print(enemy)
#		enemy.connect("death",self,"on_death")
func _process(delta):
	if selected:
		select_bar.visible=true
	else :
		select_bar.visible =false
	if get_child_count() <2 and child_counting:
		child_counting = false
		selected=false

func on_death():
	selected=false
