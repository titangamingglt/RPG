extends Control

func _ready():
	$AnimationPlayer.play("background")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="background":
		$AnimationPlayer.play("menu_button")


func _on_new_game_pressed():
	get_tree().change_scene("res://Scenes/Level_One/Main_World.tscn")
