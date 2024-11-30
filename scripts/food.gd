extends StaticBody2D

@onready var label = $Label

func _ready():
	label.hide()
	SignalManager.food_taken.connect(food_taken)

func _process(delta):
	if GameManager.food_in_range == true:
		label.show()
	else:
		label.hide()

func food_taken():
	GameManager.have_food = true
	queue_free()

func food():
	pass
