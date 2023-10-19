extends VBoxContainer

@onready var _head_label = $C_Head/VBoxContainer/HBC_Head/Head_Label
@onready var _body_label = $C_Body/VBoxContainer/HBC_Body/Body_Label
@onready var _t_shirt_label = $C_TShort/VBoxContainer/BHC_TShirt/TShirt_Label


func on_prsset_change():
	_head_label.text = "Head " + str(Character.get_head())
	_body_label.text = "Body " + str(Character.get_body())
	_t_shirt_label.text = "T-Shirt " + str(Character.get_t_shirt())
