extends Node2D

@onready var choice_button_scene = preload("res://scenes/choice_button.tscn")

var choice_buttons: Array[Button] = []
func _ready():
	add_choice("this is choice number 0")
	add_choice("this is choice number 1")
func add_text(text: String):
	$VBoxContainer/Label.text = text
	
func add_choice(choice_text: String):
	var button_object: ChoiceButton = choice_button_scene.instantiate()
	button_object.choice_index = choice_buttons.size()
	choice_buttons.push_back(button_object)
	button_object.choice_selected.connect(_on_choice_selected)
	$VBoxContainer.add_child(button_object)
	
func _on_choice_selected(choice_index: int):
	print(choice_index)
	pass
