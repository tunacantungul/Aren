extends Node2D

@export var scene_one : PackedScene
@export var scene_two : PackedScene
@export var scene_three : PackedScene
@export var scene_four : PackedScene

func _ready():
	#add_child(scene_one.instantiate())
	#var scene_two_pos = scene_two.instantiate()
	#scene_two_pos.
	pass
	spawn_scene_two()
func spawn_scene_two():
	var list = get_children()
	print(list)
	



