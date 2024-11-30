extends Area2D

@onready var path_follow = get_parent()
var SPEED = 150.0

func _physics_process(delta):
	path_follow.set_progress(path_follow.get_progress() + SPEED * delta)
