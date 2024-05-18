extends Node

var data_dict: Dictionary
var item_rarity_weight: Dictionary = {
	"common": 60,
	"uncommon": 27,
	"rate": 9,
	"epic": 3,
	"legendary": 1,
}
var item_affix_chance: Dictionary = {
	"common": 0,
	"uncommon": 25,
	"rate": 45,
	"epic": 65,
	"legendary": 90,
}

func _ready() -> void:
	var f = FileAccess.open("res://global/item_template_database.json", FileAccess.READ)
	data_dict = JSON.parse_string(f.get_as_text()) as Dictionary
	for key in data_dict:
		var dict: Dictionary = data_dict.get(key)
		var item = ItemTemplate.new(dict)
		data_dict[key] = item

func random_item_template() -> ItemTemplate:
	var keys = data_dict.keys()
	var index = randi_range(0, keys.size() - 1)
	var id = keys[index]
	return data_dict[id]

func random_rarity() -> String:
	var weight_sum = item_rarity_weight.values().reduce(func(a, b): return a + b)
	var weight = randi_range(1, weight_sum)
	var rarity = "common"
	for current_rarity in item_rarity_weight:
		var current_weight = item_rarity_weight[current_rarity]
		if weight <= current_weight:
			rarity = current_rarity
			break
		weight -= current_weight
	return rarity
