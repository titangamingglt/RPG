extends Node2D
var health =50 setget set_hp
onready var anim = $AnimationPlayer
func _ready():
	$Label.text= str(health)
	pass
	
func set_hp(damage):
	health = damage
	if health >0:
		$Label.text= str(health)
	anim.play("hit")
	yield(anim,"animation_finished")
	yield(get_tree().create_timer(.5),"timeout")
	if health >0:
		var scene = get_tree().current_scene
		var party = scene.find_node("party")
		var player = party.get_children()
		anim.play("attack")
		yield(anim,"animation_finished")
		for i in player:
			if i.selected:
				i.health-=10
		GlobalBattle.player_turned=true
	else:
		GlobalBattle.player_turned=true
		queue_free()
