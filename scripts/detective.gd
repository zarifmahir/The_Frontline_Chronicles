extends CharacterBody2D

class_name Detect

signal healthchanged

@export var speed=200
@onready var animations=$AnimationPlayer
@onready var actionable_finder=$Direction/Actionable_Finder
@onready var effects = $Effects

@onready var hurttimer = $hurtTimer
@export var maxHealth = 3
@onready var currentHealth: int = maxHealth

@export var knockbackpower: int =900
var ishurt: bool = false
func detective():
	pass

func _ready() -> void:
	effects.play("RESET")
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
	if !ishurt:
		handleInput()
		updateAnimation()
		move_and_slide()
	
func _on_hurt_box_area_entered(area: Area2D) -> void:
	if ishurt: return
	if area.name == "hitBox":
		currentHealth -= 1
		if currentHealth<0:
			currentHealth = maxHealth
			
		healthchanged.emit(currentHealth)
		ishurt = true
		knockback(area.get_parent().velocity)
		effects.play("hurtBlink")
		hurttimer.start()
		await hurttimer.timeout
		effects.play("RESET")
		ishurt = false
		
func knockback(enemyVelocity: Vector2):
	var knockbackdirection = (enemyVelocity-velocity).normalized()*knockbackpower 
	velocity = knockbackdirection
	move_and_slide()
