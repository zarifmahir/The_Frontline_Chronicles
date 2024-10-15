extends CharacterBody2D

class_name Detect

@export var speed=200
@onready var animations=$AnimationPlayer
@onready var actionable_finder=$Direction/Actionable_Finder

func detective():
	pass
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
	
	if Input.is_action_just_pressed("Chat"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size()>0:
			actionables[0].action()
			return
	
	var moveDirection=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity=moveDirection*speed

func _physics_process(delta: float) -> void:
	handleInput()
	updateAnimation()
	move_and_slide()
