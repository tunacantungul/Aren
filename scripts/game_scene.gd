extends Node2D

@export var scene_one : PackedScene
@export var scene_two : PackedScene
@export var scene_three : PackedScene
@export var scene_four : PackedScene

@onready var player = $Player
@onready var shadow = $Holder/Shadow

const SHADOW_WARNING_DISTANCE: float = 900.0
var _shadow_near_state: bool = false

func _ready():
	spawn_scene_two()
	get_tree().create_timer(2.0).timeout.connect(func(): GameManager.shadow_moving = true)

func spawn_scene_two():
	var list = get_children()
	print(list)

func _process(_delta):
	if not GameManager.shadow_moving:
		return
	var dist = player.global_position.x - shadow.global_position.x
	if dist < SHADOW_WARNING_DISTANCE and not _shadow_near_state:
		_shadow_near_state = true
		SignalManager.shadow_near.emit()
	elif dist >= SHADOW_WARNING_DISTANCE and _shadow_near_state:
		_shadow_near_state = false
		SignalManager.shadow_far.emit()
