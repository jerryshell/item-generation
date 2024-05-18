extends Node

var data_dict: Dictionary

func _ready() -> void:
	var f = FileAccess.open("res://global/item_type_to_item_affix_template_database.json", FileAccess.READ)
	data_dict = JSON.parse_string(f.get_as_text()) as Dictionary
	for key in data_dict:
		var dict: Dictionary = data_dict.get(key)
		var item = ItemTypeToItemAffixTemplate.new(dict)
		data_dict[key] = item

func list_by_item_type(item_type: String) -> Array[ItemTypeToItemAffixTemplate]:
	var list: Array[ItemTypeToItemAffixTemplate] = []
	for key in data_dict:
		var item = data_dict.get(key) as ItemTypeToItemAffixTemplate
		if item.item_type == item_type:
			list.append(item)
	return list
