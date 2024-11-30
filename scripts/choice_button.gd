class_name ChoiceButton extends Button

@onready var choice_index = 0

signal choice_selected(choice_index)

func _on_pressed():
	choice_selected.emit(choice_index)
