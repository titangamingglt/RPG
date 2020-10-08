extends Node2D

onready var enemy= preload("res://Scenes/Battle_enemy.tscn")
onready var select_bar = get_parent().get_node("selection_arrow")
export(int,0,2) var  enemy_count = 1
var enemy_container=[]
var enemy_selection =0
var selected_enemy = null
func _ready():
	select_bar.position = $enemy_one.position + Vector2(0,-20)
	var k=0
	for i in get_children():
		if k<=enemy_count:
			var enm = enemy.instance()
			i.add_child(enm)
			enm.position = Vector2(0,0)
			k+=1
		enemy_container.append(i)

func _input(event):
	if event.is_action_pressed("ui_right"):
		_selection_forward()
	elif event.is_action_pressed("ui_left"):
		_selection_backword()

func _selection_forward():
	if enemy_selection<=1:
			selected_enemy = enemy_container[enemy_selection]
			enemy_selection += 1 
			if enemy_container[enemy_selection].get_child_count()!=0:
				selected_enemy.selected =false
				selected_enemy = enemy_container[enemy_selection]
				selected_enemy.selected =true
				select_bar.position = selected_enemy.position + Vector2(0,-20)
			else :
				enemy_selection -=1
				

func _selection_backword():
	if enemy_selection>=1:
			selected_enemy = enemy_container[enemy_selection]
			enemy_selection -= 1 
			if enemy_container[enemy_selection].get_child_count()!=0:
				selected_enemy.selected =false
				selected_enemy = enemy_container[enemy_selection]
				selected_enemy.selected =true
				select_bar.position = selected_enemy.position + Vector2(0,-20)
			else :
				enemy_selection +=1
				selected_enemy = enemy_container[enemy_selection]
				selected_enemy.selected =true
				select_bar.position = selected_enemy.position + Vector2(0,-20)
	pass
			
func _on_attack_pressed():
	if GlobalBattle.player_turned:
		GlobalBattle.player_turned=false
		for i in enemy_container:
			if i.selected:
				if i.get_child_count()!=0:
					i.get_child(0).health -=15
		
