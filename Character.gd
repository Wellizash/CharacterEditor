extends Node

signal character_change
 
var head = 1;
var body = 1;
var t_shirt = 1;

func set_head(value):
	head = value
	emit_signal("character_change")
	
func set_body(value):
	body = value
	emit_signal("character_change")
	
func set_t_shirt(value):
	t_shirt = value
	emit_signal("character_change")


func get_head():
	return head
	
func get_body():
	return body
	
func get_t_shirt():
	return t_shirt
