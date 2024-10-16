extends Area2D

@export var speed = 150
func _physics_process(delta):
	global_position.x += -speed * delta  # horizontal er jonno x dilam


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.

func die():
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.die()
		die()
