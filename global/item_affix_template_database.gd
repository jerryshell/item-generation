extends Node

var data_dict: Dictionary

func _ready() -> void:
	var f = FileAccess.open("res://global/item_affix_template_database.json", FileAccess.READ)
	data_dict = JSON.parse_string(f.get_as_text()) as Dictionary
	for key in data_dict:
		var dict: Dictionary = data_dict.get(key)
		var item = ItemAffixTemplate.new(dict)
		data_dict[key] = item
