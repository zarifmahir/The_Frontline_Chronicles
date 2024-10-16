class_name Player  extends CharacterBody2D

@export var speed = 300


func die():
	queue_free()


func _physics_process(delta: float) -> void:
	var direction = Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	velocity = direction * speed
	move_and_slide()
	global_position = global_position.clamp(Vector2.ZERO, get_viewport_rect().size)
