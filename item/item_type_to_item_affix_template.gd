extends Resource
class_name ItemTypeToItemAffixTemplate

var id: String

var item_type: String
var item_affix_template_id: String
var item_affix_category: String

func _init(dict: Dictionary) -> void:
	id = dict.get("id")

	item_type = dict.get("item_type")
	item_affix_template_id = dict.get("item_affix_template_id")
	item_affix_category = dict.get("item_affix_category")
