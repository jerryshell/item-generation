extends Resource
class_name ItemAffixTemplate

var id: String

var name: String
var category: String

var effect: String
var effect_value_min: int
var effect_value_max: int
var effect_text: String

func _init(dict: Dictionary) -> void:
	id = dict.get("id")

	name = dict.get("name")
	category = dict.get("category")

	effect = dict.get("effect")
	effect_value_min = dict.get("effect_value_min")
	effect_value_max = dict.get("effect_value_max")
	effect_text = dict.get("effect_text")
