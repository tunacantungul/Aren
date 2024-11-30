extends Node

var game_scene :  PackedScene = preload("res://scenes/game_scene.tscn")
var die_scene : PackedScene = preload("res://scenes/die_scene.tscn")

var player_speed : float = 150.0

var helped_homeless_man : bool

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

func show_girl():
	SignalManager.girl_show.emit()
	
func hide_girl():
	SignalManager.girl_hide.emit()
func hide_real_girl():
	SignalManager.real_girl_hide.emit()


