extends CharacterBody2D

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.real_girl_hide.connect(hide_girl)
	label.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManager.npc_2_in_range == true:
		label.show()
	else:
		label.hide()
		
func hide_girl():
	hide()
	
func npc_2():
	pass

