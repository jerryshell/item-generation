extends Resource
class_name ItemAffix

var id: String

var name: String
var category: String

var effect: String
var effect_value: int
var effect_text: String

func _init(item: Item, affix_template_id: String) -> void:
	var item_affix_template := ItemAffixTemplateDatabase.data_dict.get(affix_template_id) as ItemAffixTemplate

	id = item.id + "__" + item_affix_template.id

	name = item_affix_template.name
	category = item_affix_template.category

	effect = item_affix_template.effect
	effect_value = randi_range(item_affix_template.effect_value_min, item_affix_template.effect_value_max)
	effect_text = item_affix_template.effect_text

func _to_string() -> String:
	return "ItemAffix(id=%s, name=%s, category=%s, effect=%s, effect_value=%s, effect_text=%s)" % [id, name, category, effect, effect_value, effect_text]
