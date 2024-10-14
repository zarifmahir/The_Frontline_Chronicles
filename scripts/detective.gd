
extends CharacterBody2D
@export var speed=350
@onready var animations=$AnimationPlayer
func updateAnimation():
	if velocity.length()==0:
		if(animations.is_playing()):
			animations.stop()
	else:
		var direction="Down"
		if velocity.x<0:direction="Left"
		elif velocity.x>0:direction="Right"
		elif velocity.y<0:direction="Up"
		animations.play("walk"+direction)
func handleInput():
	var moveDirection=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity=moveDirection*speed

func _physics_process(delta: float) -> void:
	handleInput()
	updateAnimation()
	move_and_slide()
