extends CharacterBody2D

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.npc_3_in_range == true:
		label.show()
	else:
		label.hide()
	
func npc_3():
	pass

