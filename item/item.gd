extends Resource
class_name Item

var id: String
var item_template_id: String

var name: String
var category: String
var type: String
var equiment_slot: String

var stackable: bool

var rarity: String

var damage: int
var required_strength: int
var required_dexterity: int
var defense: int
var block: int

var prefix_template_id: String
var suffix_template_id: String

var prefix: ItemAffix
var suffix: ItemAffix

func _init(_item_template: ItemTemplate, _rarity: String) -> void:
	id = _item_template.id + "_" + str(randi_range(1000, 9999))
	item_template_id = _item_template.id
	name = _item_template.name
	category = _item_template.category
	type = _item_template.type
	equiment_slot = _item_template.equiment_slot

	stackable = _item_template.stackable

	rarity = _rarity

	required_strength = _item_template.required_strength
	required_dexterity = _item_template.required_dexterity

	_determine_stats(_item_template)
	_determine_affix(_item_template)
	_determine_affix_stats()

func _to_string() -> String:
	return "Item(id=%s, item_template_id=%s, name=%s, category=%s, type=%s, equiment_slot=%s, stackable=%s, rarity=%s, damage=%s, defense=%s, block=%s, prefix_template_id=%s, suffix_template_id=%s, prefix=%s, suffix=%s)" % [id, item_template_id, name, category, type, equiment_slot, stackable, rarity, damage, defense, block, prefix_template_id, suffix_template_id, prefix, suffix]

func _determine_stats(_item_template: ItemTemplate) -> void:
	var stats_multi := 1.0
	if rarity == "common":
		stats_multi = ItemTemplateDatabase.data_dict[item_template_id].common_multi
	elif rarity == "uncommon":
		stats_multi = ItemTemplateDatabase.data_dict[item_template_id].uncommon_multi
	elif rarity == "rate":
		stats_multi = ItemTemplateDatabase.data_dict[item_template_id].rate_multi
	elif rarity == "epic":
		stats_multi = ItemTemplateDatabase.data_dict[item_template_id].epic_multi
	elif rarity == "legendary":
		stats_multi = ItemTemplateDatabase.data_dict[item_template_id].legendary_multi

	damage = int(stats_multi * randi_range(_item_template.damage_min, _item_template.damage_max))
	defense = int(stats_multi * randi_range(_item_template.defense_min, _item_template.defense_max))
	block = _item_template.block

func _determine_affix(_item_template: ItemTemplate) -> void:
	var affix_pool: Array[ItemTypeToItemAffixTemplate] = ItemTypeToItemAffixTemplateDatabase.list_by_item_type(_item_template.type)

	# build affix/subfix_template_id_pool
	var prefix_template_id_pool: Array[String] = []
	var subfix_template_id_pool: Array[String] = []
	for affix in affix_pool:
		if affix.item_affix_category == "prefix":
			prefix_template_id_pool.append(affix.item_affix_template_id)
		elif affix.item_affix_category == "suffix":
			subfix_template_id_pool.append(affix.item_affix_template_id)

	# item_affix_chance
	var item_affix_chance: int = ItemTemplateDatabase.item_affix_chance[rarity]

	# determine prefix_template_id
	if prefix_template_id_pool.is_empty() or item_affix_chance < randi_range(1, 100):
		prefix_template_id = ""
	else:
		prefix_template_id = prefix_template_id_pool[randi_range(0, prefix_template_id_pool.size() - 1)]

	# determine suffix_template_id
	if subfix_template_id_pool.is_empty() or item_affix_chance < randi_range(1, 100):
		suffix_template_id = ""
	else:
		suffix_template_id = subfix_template_id_pool[randi_range(0, subfix_template_id_pool.size() - 1)]

func _determine_affix_stats() -> void:
	if prefix_template_id:
		prefix = ItemAffix.new(self, prefix_template_id)
	if suffix_template_id:
		suffix = ItemAffix.new(self, suffix_template_id)
