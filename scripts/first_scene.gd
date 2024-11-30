extends Control

@onready var label = $Label
@onready var timer_2 = $Timer2

func _on_timer_timeout():
	label.show()
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/story.dialogue"), "story")
	

