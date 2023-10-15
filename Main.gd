extends Node

const HEAD_ROOT = "res://Assets/Character/Head/"
const BODY_ROOT = "res://Assets/Character/Body/"
const NEKS_ROOT = "res://Assets/Character/Body/Neks"


#body parts
var head_array = []
var body_array = []
var neks_array = []
var left_arms_array = []
var right_arms_array = []


#body parts
var head_number = 1
var body_number = 1

#clothe
var t_shirt_number = 1
var tShirts_style_count = 0

#body parts
@onready var _head = $Control/MarginContainer/Control/CharacterPreview/HeadSprite
@onready var _body = $Control/MarginContainer/Control/CharacterPreview/BodySprite
@onready var _neck = $Control/MarginContainer/Control/CharacterPreview/NeckSprite
@onready var _leftArm = $Control/MarginContainer/Control/CharacterPreview/LeftArm
@onready var _rightArm = $Control/MarginContainer/Control/CharacterPreview/RightArm

#clothe
@onready var _tShirt = $Control/MarginContainer/Control/CharacterPreview/TShirt

func get_head_path(index):
	return HEAD_ROOT + str(index) + ".png"
	
func get_body_path(index):
	return BODY_ROOT + str(index) + "/" + str(index) + ".png"

func get_neck_path(index):
	return BODY_ROOT + str(index) + "/neck.png"

func get_left_arm_path(index):
	return BODY_ROOT + str(index) + "/leftArm.png"
	
func get_right_arm_path(index):
	return BODY_ROOT + str(index) + "/rightArm.png"

func get_clothe_path(bodyIndex, clotheType, clotheIndex):
	return BODY_ROOT + str(bodyIndex) + "/" + str(clotheType) + "/" + str(clotheIndex) + ".png"


func get_head_array():
	var i = 1;
	
	while true:
		if load(get_head_path(i)) != null:
			head_array.append(load(get_head_path(i)))
		else:
			break
		
		i += 1


func get_body_parts_arrays():
	var i = 1;
	
	while true:
		if load(get_body_path(i)) != null:
			left_arms_array.append(load(get_left_arm_path(i)))
			right_arms_array.append(load(get_right_arm_path(i)))
			body_array.append(load(get_body_path(i)))
			neks_array.append(load(get_neck_path(i)))
		else:
			break
			
		i += 1


func  get_new_head():
	if head_number == head_array.size() + 1:
		head_number = 1
	if head_number == 0:
		head_number = head_array.size();
	
	_head.texture = head_array[head_number - 1]
	
	
func  get_new_tShirt():
	if(t_shirt_number == tShirts_style_count + 1):
		t_shirt_number = 1
	if(t_shirt_number == 0):
		t_shirt_number = tShirts_style_count
		
	_tShirt.texture = load(get_clothe_path(body_number, "t-shirts", t_shirt_number))


func  get_new_body():
	if body_number == body_array.size() + 1:
		body_number = 1
	if body_number == 0:
		body_number = body_array.size();
	
	
	#body part texture load
	_leftArm.texture = left_arms_array[body_number - 1]
	_rightArm.texture = right_arms_array[body_number - 1] 
	_neck.texture = neks_array[body_number - 1]
	_body.texture = body_array[body_number - 1]
	
	#clothe
	get_new_tShirt()


func _on_head_next_pressed():
	head_number += 1
	get_new_head()
	
func _on_head_prew_pressed():
	head_number -= 1
	get_new_head()
	
func _on_body_next_pressed():
	body_number += 1
	get_new_body()
	
func _on_body_prew_pressed():
	body_number -= 1
	get_new_body()

func _on_tSirt_next_pressed():
	t_shirt_number += 1
	get_new_tShirt()
	
func _on_tSirt_prev_pressed():
	t_shirt_number -= 1
	get_new_tShirt()


func colculate_tShirts_count():
	var dir = DirAccess.open(BODY_ROOT + "1/t-shirts")
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		
		while file_name != "":
			tShirts_style_count += 1
			file_name = dir.get_next()
			file_name = dir.get_next()


func _ready():
	get_body_parts_arrays()
	get_head_array()
	
	colculate_tShirts_count()


func _process(_delta):
	pass
