extends Node

const HEAD_ROOT = "res://Assets/Character/Head/"
const BODY_ROOT = "res://Assets/Character/Body/"

var head_array = []
var body_array = []

var head_number = 1
var body_number = 1

@onready var _head = $Control/MarginContainer/Control/CharacterPreview/HeadSprite
@onready var _body = $Control/MarginContainer/Control/CharacterPreview/BodySprite


func get_head_path(index):
	return HEAD_ROOT + str(index) + ".png"
	
func get_body_path(index):
	return BODY_ROOT + str(index) + "/" + str(index) + ".png"


func get_head_array():
	var i = 1;
	
	while true:
		if load(get_head_path(i)) != null:
			head_array.append(load(get_head_path(i)))
		else:
			break
		
		i += 1


func get_body_array():
	var i = 1;
	
	while true:
		if load(get_body_path(i)) != null:
			body_array.append(load(get_body_path(i)))
		else:
			break
			
		i += 1


func  get_new_head():
	if head_number == head_array.size() + 1:
		head_number = 1
	if head_number == 0:
		head_number = head_array.size();
	
	_head.texture = head_array[head_number - 1]


func  get_new_body():
	if body_number == body_array.size() + 1:
		body_number = 1
	if body_number == 0:
		body_number = body_array.size();
	
	_body.texture = body_array[body_number - 1]

func _on_head_next_pressed():
	head_number+=1
	get_new_head()
	
func _on_head_prew_pressed():
	head_number-=1
	get_new_head()
	
func _on_body_next_pressed():
	body_number+=1
	get_new_body()
	
func _on_body_prew_pressed():
	body_number-=1
	get_new_body()



func _ready():
	get_body_array();
	get_head_array();


func _process(delta):
	pass
