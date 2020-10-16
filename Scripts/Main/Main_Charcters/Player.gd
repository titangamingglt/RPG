extends KinematicBody2D

var velocity = Vector2()
var accleration =60
const MAX_SPEED =100
const friction = 10
var input_strenght= Vector2.ZERO
onready var animate = $Animated_sprite
onready var dia_bub = $Dia_bubble
onready var dia_bub_anim =$dia_buble_aniamtion
func _ready():
	dia_bub.visible=false
	pass
# warning-ignore:unused_argument
func _physics_process(delta):
	input_strenght.x =Input.get_action_strength("ui_right")- Input.get_action_strength("ui_left")
	input_strenght.y = Input.get_action_strength("ui_down")- Input.get_action_strength("ui_up")
	
	input_strenght = input_strenght.normalized()

	
	if input_strenght != Vector2.ZERO:
		velocity = velocity.move_toward(input_strenght*MAX_SPEED,accleration)
	else:
		velocity= velocity.move_toward(Vector2.ZERO,friction)
	velocity = move_and_slide(velocity)
	animation()

func animation():
	if input_strenght.x>0:
		animate.play("right")
	elif input_strenght.x<0:
		animate.play("left")
	elif  input_strenght.y<0:
		animate.play("up")
	elif input_strenght.y>0:
		animate.play("down")
	else:
		animate.stop()
	pass


func _on_Area2D_area_entered(area):
	if area.is_in_group("NPC"):
		dia_bub.visible=true
		dia_bub_anim.play("open")



func _on_Area2D_area_exited(area):
	if area.is_in_group("NPC"):
		dia_bub_anim.play("close")
	
