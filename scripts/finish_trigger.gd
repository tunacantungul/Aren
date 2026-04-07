extends Area2D

func _on_body_entered(body):
	if body.has_method("player"):
		if GameManager.help_count == 0:
			GameManager.die()
		else:
			GameManager.good_ending()
