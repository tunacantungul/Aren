extends Control

@onready var label = $Label

func _on_timer_timeout():
	label.show()
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/story.dialogue"), "story")
	
