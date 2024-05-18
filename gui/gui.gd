extends Control

@onready var prefix_label: Label = %PrefixLabel
@onready var item_name_label: Label = %ItemNameLabel
@onready var suffix_label: Label = %SuffixLabel
@onready var rarity_label: Label = %RarityLabel

@onready var required_strength_container: HBoxContainer = $Panel/VBoxContainer/RequiredStrengthContainer
@onready var required_strength_label: Label = $Panel/VBoxContainer/RequiredStrengthContainer/RequiredStrengthLabel
@onready var required_dexterity_container: HBoxContainer = $Panel/VBoxContainer/RequiredDexterityContainer
@onready var required_dexterity_label: Label = $Panel/VBoxContainer/RequiredDexterityContainer/RequiredDexterityLabel

@onready var damage_container: HBoxContainer = $Panel/VBoxContainer/DamageContainer
@onready var damage_label: Label = $Panel/VBoxContainer/DamageContainer/DamageLabel
@onready var defense_container: HBoxContainer = $Panel/VBoxContainer/DefenseContainer
@onready var defense_label: Label = $Panel/VBoxContainer/DefenseContainer/DefenseLabel
@onready var block_container: HBoxContainer = $Panel/VBoxContainer/BlockContainer
@onready var block_label: Label = $Panel/VBoxContainer/BlockContainer/BlockLabel

@onready var prefix_container: HBoxContainer = %PrefixContainer
@onready var prefix_effect_value_label: Label = %PrefixEffectValueLabel
@onready var prefix_effect_text_label: Label = %PrefixEffectTextLabel

@onready var suffix_container: HBoxContainer = %SuffixContainer
@onready var suffix_effect_value_label: Label = %SuffixEffectValueLabel
@onready var suffix_effect_text_label: Label = %SuffixEffectTextLabel

func _ready() -> void:
	EventBus.item_generated.connect(_on_item_generated)

func _on_button_pressed() -> void:
	EventBus.item_generation_button_pressed.emit()

func _on_item_generated(item: Item) -> void:
	print(item)

	if item.prefix:
		prefix_label.text = item.prefix.name
		prefix_label.visible = true
	else:
		prefix_label.text = ""
		prefix_label.visible = false
	item_name_label.text = item.name

	if item.suffix:
		suffix_label.text = item.suffix.name
		suffix_label.visible = true
	else:
		suffix_label.text = ""
		suffix_label.visible = false

	rarity_label.text = item.rarity
	var color = Color("#ffffff")
	if item.rarity == "uncommon":
		color = Color("#1eff00")
	elif item.rarity == "rate":
		color = Color("#0081ff")
	elif item.rarity == "epic":
		color = Color("#c600ff")
	elif item.rarity == "legendary":
		color = Color("#ff8000")
	item_name_label.add_theme_color_override("font_color", color)
	rarity_label.add_theme_color_override("font_color", color)

	if item.required_strength:
		required_strength_label.text = str(item.required_strength)
		required_strength_container.visible = true
	else:
		required_strength_label.text = ""
		required_strength_container.visible = false

	if item.required_dexterity:
		required_dexterity_label.text = str(item.required_dexterity)
		required_dexterity_container.visible = true
	else:
		required_dexterity_label.text = ""
		required_dexterity_container.visible = false

	if item.damage:
		damage_label.text = str(item.damage)
		damage_container.visible = true
	else:
		damage_label.text = ""
		damage_container.visible = false

	if item.defense:
		defense_label.text = str(item.defense)
		defense_container.visible = true
	else:
		defense_label.text = ""
		defense_container.visible = false

	if item.block:
		block_label.text = str(item.block)
		block_container.visible = true
	else:
		block_label.text = ""
		block_container.visible = false

	if item.prefix:
		prefix_effect_value_label.text = str(item.prefix.effect_value)
		prefix_effect_text_label.text = item.prefix.effect_text
		prefix_container.visible = true
	else:
		prefix_effect_value_label.text = ""
		prefix_effect_text_label.text = ""
		prefix_container.visible = false

	if item.suffix:
		suffix_effect_value_label.text = str(item.suffix.effect_value)
		suffix_effect_text_label.text = item.suffix.effect_text
		suffix_container.visible = true
	else:
		suffix_effect_value_label.text = ""
		suffix_effect_text_label.text = ""
		suffix_container.visible = false
