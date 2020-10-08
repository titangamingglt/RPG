extends Node2D

onready var enemy= preload("res://Scenes/Battle_enemy.tscn")
export(int,0,2) var  enemy_count = 1
var enemy_container=[]
var enemy_selection =0
var selected_enemy = null

func _ready():
	var k=0
	for i in get_children():
		if k<=GlobalBattle.enemy_number:
			if k < GlobalBattle.enemy_type.size():
				enemy = load(GlobalBattle.enemy_type[k])
				var enm = enemy.instance()
				i.add_child(enm)
				enm.position = Vector2(0,0)
			k+=1
		enemy_container.append(i)
	selected_enemy = enemy_container[enemy_selection]


func _input(event):
	if event.is_action_pressed("ui_right"):
		_selection_forward()
	elif event.is_action_pressed("ui_left"):
		_selection_backword()

func _selection_forward():
	if enemy_selection+1< enemy_container.size():
		if enemy_container[enemy_selection+1].get_child_count()>=2:
			selected_enemy.selected =false
			selected_enemy = enemy_container[enemy_selection+1]
			selected_enemy.selected =true
			enemy_selection += 1
		
		else :
			for i in range(enemy_selection,enemy_container.size()):
				var incr=i + 1
				if incr<enemy_container.size():
					if enemy_container[incr].get_child_count()>=2:
						selected_enemy.selected =false
						selected_enemy = enemy_container[incr]
						selected_enemy.selected =true
						enemy_selection = incr
						break

func _selection_backword():
	if enemy_container[enemy_selection-1].get_child_count()>=2 and enemy_selection-1>= 0:
		selected_enemy.selected =false
		selected_enemy = enemy_container[enemy_selection-1]
		selected_enemy.selected =true
		enemy_selection -= 1
		
	else :
		for i in range(enemy_selection,0,-1):
			var dcr= i - 1
			if dcr>=0:
				if enemy_container[dcr].get_child_count()>=2:
					selected_enemy.selected =false
					selected_enemy = enemy_container[dcr]
					selected_enemy.selected =true
					enemy_selection = dcr
					break
				
		

			
func _on_attack_pressed():
	for i in enemy_container:
		if i.selected:
			if i.get_child_count()>=2:
				if GlobalBattle.player_turned:
					GlobalBattle.player_turned=false
					i.get_child(1).health -=GlobalBattle.player_damage


