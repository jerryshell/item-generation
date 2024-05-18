extends Resource
class_name ItemTemplate

var id: String

var name: String
var category: String
var type: String
var equiment_slot: String

var stackable: bool

var damage_min: int
var damage_max: int

var required_strength: int
var required_dexterity: int

var defense_min: int
var defense_max: int

var block: int

var common_multi: float
var uncommon_multi: float
var rate_multi: float
var epic_multi: float
var legendary_multi: float

func _init(dict: Dictionary):
	id = dict.get("id")

	name = dict.get("name")
	category = dict.get("category")
	type = dict.get("type")
	equiment_slot = dict.get("equiment_slot")

	stackable = dict.get("stackable")

	damage_min = dict.get("damage_min")
	damage_max = dict.get("damage_max")

	required_strength = dict.get("required_strength")
	required_dexterity = dict.get("required_dexterity")

	defense_min = dict.get("defense_min")
	defense_max = dict.get("defense_max")

	block = dict.get("block")

	common_multi = dict.get("common_multi")
	uncommon_multi = dict.get("uncommon_multi")
	rate_multi = dict.get("rate_multi")
	epic_multi = dict.get("epic_multi")
	legendary_multi = dict.get("legendary_multi")
