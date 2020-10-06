extends Node

var did = 0
var nid = 0
var choice =""

signal requested_info
signal request_dialog

func _requested_info():
	emit_signal("requested_info")

func _requesting_dialog(filename,convoname):
	emit_signal("request_dialog",filename,convoname)
	pass
