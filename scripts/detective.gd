extends CharacterBody2D

class_name Detect

signal healthchanged

@export var speed=200
@onready var animations=$AnimationPlayer
@onready var actionable_finder=$Direction/Actionable_Finder
@onready var effects = $Effects

@onready var swordsound = $AudioStreamPlayer2D
@onready var chatclick = $chatclick
@onready var hurtBox = $hurtBox

@onready var hurttimer = $hurtTimer
@export var maxHealth = 3
@onready var currentHealth: int = maxHealth

@onready var chatttimer = $chatTimer

@onready var weapon = $weapon
@export var knockbackpower: int =900


var direction
var direction2
var lastAnimeDirection: String = "Down"
var ishurt: bool = false
var isAttacking: bool = false
var can_do_action: bool = true
var noheart: String = "Zeroheart"
func detective():
	pass

func _ready() -> void:
	direction = "idle"
	effects.play("RESET")
	weapon.disable()
	
func updateAnimation():
	if isAttacking: return
	if velocity.length()==0:
		if(animations.is_playing()):
			animations.stop()
			direction2 = "stp"
	else:
		direction = "Down"
		
		if velocity.x<0:direction="Left"
		elif velocity.x>0:direction="Right"
		elif velocity.y<0:direction="Up"
		elif velocity.y>0: direction = "Down"
		direction2 = direction
		animations.play("walk"+direction)
		lastAnimeDirection = direction
		
func handleInput():
	
	if Input.is_action_just_pressed("Chat") and can_do_action:
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size()>0:
			chatclick.play(0)
			actionables[0].action()
			can_do_action = false
			chatttimer.start()
			return
	
	var moveDirection=Input.get_vector("a","d","w","s")
	velocity=moveDirection*speed
	
	if Input.is_action_just_pressed("attack"):
		attac()
		
func attac():
	animations.play("Attack"+lastAnimeDirection)
	isAttacking = true
	weapon.enable()
	swordsound.play(0)
	await animations.animation_finished
	weapon.disable()
	animations.play("walk"+lastAnimeDirection)
	isAttacking = false
	
func _physics_process(delta: float) -> void:
	if !ishurt:
		handleInput()
		move_and_slide()
		updateAnimation()
	
func _on_hurt_box_area_entered(area: Area2D) -> void:
	if ishurt: return
	if area.name == "hitBox":
		currentHealth -= 1
		if currentHealth<1:
			Scene_Manager.last_scene_name = get_parent().name
			var fp = "res://scenes/Zeroheart.tscn"
			get_tree().call_deferred("change_scene_to_file", fp)
			
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


func _on_chat_timer_timeout() -> void:
	can_do_action = true
