extends CharacterBody2D

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label.hide()

func _process(delta):
	if GameManager.npc_1_in_range == true:
		label.show()
	else:
		label.hide()

func npc_1():
	pass
