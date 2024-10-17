extends CharacterBody2D

var pl: Detect
var speed = 50
var player_chase = false
var player = null
@onready var animations = $AnimatedSprite2D

func _ready() -> void:
	animations.play("idle")
	
func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position - position)/speed 
		updateVelocity()
		move_and_slide()
		updateAnimation()
	else: 
		animations.play("idle")
		
func updateVelocity():
	var moveDirection = position
	velocity = moveDirection.normalized()*speed

func updateAnimation():
	if velocity.length()==0:
		if(animations.is_playing()):
			animations.stop()
			
	else:
		var direc = player.direction2
		if direc == "stp": 
			animations.stop()
		else:
			animations.play("walk"+direc)


		
func _on_detectionarea_body_entered(body: Node2D) -> void:
	if body is Detect:
		player = body
		player_chase = true


func _on_detectionarea_body_exited(body: Node2D) -> void:
	if body is Detect:
		player = body
		player_chase = true
