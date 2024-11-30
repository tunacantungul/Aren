extends CharacterBody2D

var collided_player = false

func _physics_process(delta):
	velocity.x = GameManager.shadow_speed
	move_and_slide()
	


func _on_shadow_area_body_entered(body):
	if body.has_method("player"):
		collided_player = true
		GameManager.die()


func _on_shadow_area_body_exited(body):
	if body.has_method("player"):
		collided_player = false
