extends Node

const HEAD_ROOT = "res://Assets/Character/Head"
const BODY_ROOT = "res://Assets/Character/Body"
const NEKS_ROOT = "res://Assets/Character/Body/Neks"


var heads_number = []
var bodys_number = []
var t_shirts_number = []

var current_t_shirt = 1
var current_body = 1
var current_head = 1


@onready var _head = $Control/MarginContainer/Control/CharacterPreview/HeadSprite
@onready var _body = $Control/MarginContainer/Control/CharacterPreview/BodySprite
@onready var _neck = $Control/MarginContainer/Control/CharacterPreview/NeckSprite
@onready var _leftArm = $Control/MarginContainer/Control/CharacterPreview/LeftArm
@onready var _rightArm = $Control/MarginContainer/Control/CharacterPreview/RightArm

@onready var _tShirt = $Control/MarginContainer/Control/CharacterPreview/TShirt


func get_head_path():
	return HEAD_ROOT + "/" + str(current_head) + ".png"
	
func get_body_path():
	return BODY_ROOT + "/" + str(current_body) + "/" + str(current_body) + ".png"

func get_neck_path():
	return BODY_ROOT + "/" + str(current_body) + "/neck.png"

func get_left_arm_path():
	return BODY_ROOT + "/" + str(current_body) + "/leftArm.png"
	
func get_right_arm_path():
	return BODY_ROOT + "/" + str(current_body) + "/rightArm.png"

func get_clothe_path(bodyIndex, clotheType, clotheIndex):
	return BODY_ROOT + "/" + str(bodyIndex) + "/" + str(clotheType) + "/" + str(clotheIndex) + ".png"


func  get_new_head():
	current_head -= 1
	if current_head == heads_number.size() + 1:
		current_head = 1
	if current_head == -1:
		current_head = heads_number.size() - 1;
	current_head += 1
	_head.texture = load(get_head_path())
	
	
func  get_new_tShirt():
	if(current_t_shirt == t_shirts_number.size() + 1):
		current_t_shirt = 1
	if(current_t_shirt == 0):
		current_t_shirt = t_shirts_number.size()
	push_error("search in: " + get_clothe_path(current_body, "t-shirts", current_t_shirt))
	_tShirt.texture = load(get_clothe_path(current_body, "t-shirts", current_t_shirt))


func  get_new_body():
	if current_body == bodys_number.size() + 1:
		current_body = 1
	if current_body == 0:
		current_body = bodys_number.size();
	
	_leftArm.texture = load(get_left_arm_path())
	_rightArm.texture = load(get_right_arm_path())
	_neck.texture = load(get_neck_path())
	_body.texture = load(get_body_path())
	
	get_new_tShirt()


func _on_head_next_pressed():
	current_head += 1
	get_new_head()
	
func _on_head_prew_pressed():
	current_head -= 1
	get_new_head()
	
func _on_body_next_pressed():
	current_body += 1
	get_new_body()
	
func _on_body_prew_pressed():
	current_body -= 1
	get_new_body()

func _on_tSirt_next_pressed():
	current_t_shirt += 1
	get_new_tShirt()
	
func _on_tSirt_prev_pressed():
	current_t_shirt -= 1
	get_new_tShirt()


func colculate_files_in_directory(path, step, counter):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		
		while file_name != "":
			counter.append(1)
			file_name = dir.get_next()
			if(step):
				file_name = dir.get_next()


func _ready():	
	colculate_files_in_directory(HEAD_ROOT, 1, heads_number)
	colculate_files_in_directory(BODY_ROOT, 1, bodys_number)
	push_error(bodys_number.size())
	colculate_files_in_directory(BODY_ROOT + "/1/t-shirts", 1, t_shirts_number)
	push_error(t_shirts_number.size())


func _process(_delta):
	pass
