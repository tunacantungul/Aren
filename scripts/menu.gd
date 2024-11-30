extends Control
@onready var sound = $Sound

func _ready():
	sound.play()
func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/first_scene.tscn")
	
func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
