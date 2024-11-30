extends StaticBody2D

@onready var label = $Label

func _ready():
	label.hide()
	SignalManager.drink_taken.connect(drink_taken)
	
func _process(delta):
	if GameManager.drink_in_range == true:
		label.show()
	else:
		label.hide()

func drink_taken():
	GameManager.have_drink = true
	queue_free()

func drink():
	pass
