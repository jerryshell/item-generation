extends Node2D

func _ready() -> void:
	EventBus.item_generation_button_pressed.connect(_on_gui_item_generation_button_pressed)

func item_generation() -> Item:
	var item_template = ItemTemplateDatabase.random_item_template()
	var rarity = ItemTemplateDatabase.random_rarity()
	return Item.new(item_template, rarity)

func _on_gui_item_generation_button_pressed() -> void:
	var item: Item = item_generation()
	EventBus.item_generated.emit(item)
