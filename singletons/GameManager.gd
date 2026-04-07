extends Node

var game_scene :  PackedScene = preload("res://scenes/game_scene.tscn")
var die_scene : PackedScene = preload("res://scenes/die_scene.tscn")
var good_ending_scene : PackedScene = preload("res://scenes/good_ending.tscn")

var player_speed : float = 150.0
var speed_boost_active: bool = false
var _boost_timer: float = 0.0
const BOOST_DURATION: float = 8.0
const BOOST_SPEED: float = 230.0

var helped_homeless_man : bool
var help_count: int = 0

var have_food = false
var have_drink = false

var npc_1_in_range = false
var npc_2_in_range = false
var npc_3_in_range = false
var npc_4_in_range = false
var npc_5_in_range = false
var npc_6_in_range = false

var food_in_range = false
var drink_in_range = false

var food_given = false
var drink_given = false
var girl_taken = false

var shadow_speed = 100.0

func change():
	get_tree().change_scene_to_packed(game_scene)
	
func die():
	get_tree().change_scene_to_packed(die_scene)

func good_ending():
	get_tree().change_scene_to_packed(good_ending_scene)

func show_girl():
	SignalManager.girl_show.emit()
	
func hide_girl():
	SignalManager.girl_hide.emit()
func hide_real_girl():
	SignalManager.real_girl_hide.emit()

func give_speed_boost():
	speed_boost_active = true
	_boost_timer = BOOST_DURATION
	SignalManager.speed_boost_started.emit()

func increment_help_count():
	help_count += 1
	SignalManager.help_count_updated.emit(help_count)

func _process(delta):
	if speed_boost_active:
		_boost_timer -= delta
		if _boost_timer <= 0.0:
			speed_boost_active = false
			SignalManager.speed_boost_ended.emit()
