extends CharacterBody2D

@onready var AP = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var Sound = $AudioStreamPlayer
@onready var npc_2 = $NPC_2
@onready var sprite_2d = $NPC_2/Sprite2D
@onready var animation_player = $NPC_2/AnimationPlayer

var gravity : float = 980.0

var npc_in_range = false
var interact_in_range = false

func player():
	pass

func _ready():
	SignalManager.girl_hide.connect(girl_hide)
	SignalManager.girl_show.connect(girl_show)
	SignalManager.girl_idle.connect(girl_idle)
	SignalManager.girl_walk.connect(girl_walk)
	npc_2.hide()

func _physics_process(delta):
	#DialogueManager.show_example_dialogue_balloon(load("res://dialogues/main.dialogue"), "start")

	var PlayerSpeed = GameManager.player_speed
	if GameManager.npc_1_in_range == true:
		if Input.is_action_just_pressed("interact"):
			DialogueManager.show_example_dialogue_balloon(load("res://dialogues/main.dialogue"), "npc_1")
			return
	if GameManager.npc_3_in_range == true:
		if Input.is_action_just_pressed("interact"):
			DialogueManager.show_example_dialogue_balloon(load("res://dialogues/main.dialogue"), "npc_2")
			return
	if GameManager.food_in_range == true:
		if Input.is_action_just_pressed("interact"):
			SignalManager.food_taken.emit()
	if GameManager.npc_2_in_range == true:
		if Input.is_action_just_pressed("interact"):
			DialogueManager.show_example_dialogue_balloon(load("res://dialogues/main.dialogue"), "npc_3")
	if GameManager.npc_4_in_range == true:
		if Input.is_action_just_pressed("interact"):
			DialogueManager.show_example_dialogue_balloon(load("res://dialogues/main.dialogue"), "npc_1_a")
	if GameManager.npc_5_in_range == true:
		if Input.is_action_just_pressed("interact"):
			DialogueManager.show_example_dialogue_balloon(load("res://dialogues/main.dialogue"), "npc_4")
	
	var character_direction = Input.get_axis("A", "D")
	
	if PlayerSpeed == 0:
		velocity.x = 0
		
	
	if character_direction:
		if PlayerSpeed != 0:
			AP.play("run")
			if character_direction == 1:
				SignalManager.girl_walk.emit()
				sprite_2d.flip_h = true
				velocity.x = PlayerSpeed
				sprite.flip_h = false
			elif character_direction == -1:
				SignalManager.girl_walk.emit()
				sprite_2d.flip_h = false
				velocity.x = -PlayerSpeed
				sprite.flip_h = true
	else:
		SignalManager.girl_idle.emit()
		AP.play("idle")
		velocity.x = move_toward(velocity.x, 0, PlayerSpeed)
	
	move_and_slide()

func girl_hide():
	npc_2.hide()
func girl_show():
	npc_2.show()
func girl_idle():
	animation_player.play("idle")
func girl_walk():
	animation_player.play("run")

func _on_detection_area_body_entered(body):
	if body.has_method("interact"):
		interact_in_range = true
		print("var")
	if body.has_method("npc_1"):
		GameManager.npc_1_in_range = true
	if body.has_method("npc_2"):
		GameManager.npc_2_in_range = true
	if body.has_method("npc_3"):
		GameManager.npc_3_in_range = true
	if body.has_method("food"):
		GameManager.food_in_range = true
	if body.has_method("drink"):
		GameManager.drink_in_range = true
	if body.has_method("npc_4"):
		GameManager.npc_4_in_range = true
	if body.has_method("bush"):
		GameManager.player_speed = 120.0
	if body.has_method("npc_5"):
		GameManager.npc_5_in_range = true
	if body.has_method("shadow_speeder"):
		GameManager.shadow_speed = 180.0
		


func _on_detection_area_body_exited(body):
	if body.has_method("interact"):
		interact_in_range = false
	if body.has_method("npc_1"):
		GameManager.npc_1_in_range = false
	if body.has_method("npc_2"):
		GameManager.npc_2_in_range = false
	if body.has_method("npc_3"):
		GameManager.npc_3_in_range = false
	if body.has_method("food"):
		GameManager.food_in_range = false
	if body.has_method("drink"):
		GameManager.drink_in_range = false
	if body.has_method("npc_4"):
		GameManager.npc_4_in_range = false
	if body.has_method("bush"):
		GameManager.player_speed = 150.0
	if body.has_method("npc_5"):
		GameManager.npc_5_in_range = false


func _on_timer_timeout():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/main.dialogue"), "start")
