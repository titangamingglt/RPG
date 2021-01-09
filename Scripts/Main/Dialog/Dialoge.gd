extends Node

onready var _Dialog_Box = $Control
onready var _SpaceBar_Icon= $Control/Body/Press
onready var _Body_LBL= $Control/Body/main_body/Body
onready var _Body_AnimationPlayer =$Control/Body/main_body/Body/AnimationPlayer
onready var _Speaker_LBL=$Control/Body/Speaker/Label
onready var _Option_List = $Control/Body/Option
onready var _Character_Texture = $Control/Body/Char_texture
onready var _Dialog_file = preload("res://Dialouge/bake.tres")
onready var _Dialog_name ="k"

var _did = 0
var _nid = 0
var _final_nid = 4
var _Story_Reader
var option =false
var chosen_option = ""
var _texture_library = {}
signal choice
# Virtual Methods

func _ready():
	var Story_Reader_Class = load("res://addons/EXP-System-Dialog/Reference_StoryReader/EXP_StoryReader.gd")
	_Story_Reader = Story_Reader_Class.new()
	
	
	
	
#	_Dialog_Box.visible = false
#	_SpaceBar_Icon.visible = false
#	_SelectChoice_Icon.visible = false
	_Option_List.visible = false
#	_Character_Texture.visible = false
	_Dialog_Box.visible=false
	_SpaceBar_Icon.visible=false
#	_clear_options()
	DialogGlobal.connect("request_dialog",self,"choose_dialog")


func _input(event):
	if event.is_action_pressed("ui_down"):
		_on_Dialog_Player_pressed_spacebar()
	if option:
		if event.is_action_pressed("Yes"):
			_on_Option_clicked(0)
			chosen_option ="Yes"
		elif event.is_action_pressed("No"):
			_on_Option_clicked(1)
			chosen_option ="No"

# Callback Methods
#

func _on_Dialog_Player_pressed_spacebar():
	if _is_waiting():
		_SpaceBar_Icon.visible = false
#		_Character_Texture.visible = false
		_get_next_node()
		if _is_playing():
			_play_node()


func _on_Option_clicked(slot : int):
#	_SelectChoice_Icon.visible = false
	_Option_List.visible = false
#	_Character_Texture.visible = false
	_get_next_node(slot)
#	_clear_options()
	if _is_playing():
		_play_node()

# Public Methods

func play_dialog(record_name : String):
	_load_textures()
	_did = _Story_Reader.get_did_via_record_name(record_name)
	_nid = _Story_Reader.get_nid_via_exact_text(_did, "<start>")
	_final_nid = _Story_Reader.get_nid_via_exact_text(_did, "<end>")
	_get_next_node()
	_play_node()
	_Dialog_Box.visible = true

# Private Methods

#func _clear_options():
##	var children = _Option_List.get_children()
##	for child in children:
##		_Option_List.remove_child(child)
##		child.queue_free()
##	_Option_List.rect_size.y = 48
##	_Option_List.rect_position.y = -60
#	pass


func _display_image(key : String):
	_Character_Texture.texture = _texture_library[key]
	_Character_Texture.visible = true
	pass


func _get_next_node(slot : int = 0):
	_nid = _Story_Reader.get_nid_from_slot(_did, _nid, slot)
	
	if _nid == _final_nid:
		_Dialog_Box.visible = false
		_which_option_chosen(_did,_nid)
		get_tree().paused=false
		


func _get_tagged_text(tag : String, text : String):
	var start_tag = "<" + tag + ">"
	var end_tag = "</" + tag + ">"
	var start_index = text.find(start_tag) + start_tag.length()
	var end_index = text.find(end_tag)
	var substr_length = end_index - start_index
	return text.substr(start_index, substr_length)


#func _inject_variables(text : String) -> String:
#	var variable_count = text.count("<variable>")
#
#	for i in range(variable_count):
#		var variable_name = _get_tagged_text("variable", text)
#		var variable_value = _Registry.lookup(variable_name)
#		var start_index = text.find("<variable>")
#		var end_index = text.find("</variable>") + "</variable>".length()
#		var substr_length = end_index - start_index
#		text.erase(start_index, substr_length)
#		text = text.insert(start_index, str(variable_value))
#
#	return text


func _is_playing():
	return _Dialog_Box.visible


func _is_waiting():
	return _SpaceBar_Icon.visible


func _load_textures():
	var did = _Story_Reader.get_did_via_record_name("Texture_library")
	var json_text = _Story_Reader.get_text(did, 1)
	var raw_texture_library : Dictionary = parse_json(json_text)
	for key in raw_texture_library:
		var texture_path = raw_texture_library[key]
		var loaded_texture = load(texture_path)
		_texture_library[key] = loaded_texture
	print(_texture_library)

func _play_node():
	get_tree().paused=true
	var text = _Story_Reader.get_text(_did, _nid)
#	text = _inject_variables(text)
	var speaker = _get_tagged_text("speaker", text)
	var dialog = _get_tagged_text("dialog", text)
	if "<choiceJSON>" in text:
		option=true
		var options = _get_tagged_text("choiceJSON", text)
		_populate_choices(options)
	else :
		option=false
#	else:
#		option=false
#		_Option_List.get_node("Yes").visible =false
#		_Option_List.get_node("No").visible =false
	if "<image>" in text:
		var library_key = _get_tagged_text("image", text)
		_display_image(library_key)
	_Speaker_LBL.text = speaker
	_Body_LBL.text = dialog
	_Body_AnimationPlayer.play("text")
	_request_info()

func _populate_choices(JSONtext : String):
	var choices : Dictionary = parse_json(JSONtext)
	
#	for text in choices:
#		var slot = choices[text]
#		var new_option_button = _Option_Button_Scene.instance()
#		_Option_List.add_child(new_option_button)
#		new_option_button.slot = slot
#		new_option_button.set_text(text)
#		new_option_button.connect("clicked", self, "_on_Option_clicked")


func _on_AnimationPlayer_animation_finished(anim_name):
	if !option:
		_SpaceBar_Icon.visible = true
	else:
#	_SelectChoice_Icon.visible = true
		_Option_List.visible = true
	pass

func choose_dialog(file_name,dialog_name):
	_Dialog_file = load(file_name)
	_Dialog_name = dialog_name
	var story = _Dialog_file
	if story != null:
		_Story_Reader.read(story)
		play_dialog(_Dialog_name)
		
func _request_info():
	DialogGlobal.did = _did
	DialogGlobal.nid = _nid
	DialogGlobal.choice= chosen_option
	DialogGlobal._requested_info()
func _which_option_chosen(did, nid):
	emit_signal("choice", did, nid,chosen_option)
