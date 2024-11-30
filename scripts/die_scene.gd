extends Control

@export var menu_scene : PackedScene

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_packed(menu_scene)
