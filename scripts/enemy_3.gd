extends CharacterBody2D

var pl: Detect
var speed = 50
var player_chase = false
var player = null
@onready var animations = $AnimatedSprite2D
@onready var anime = $AnimationPlayer

var count: int = 0
var isdead: bool = false
	
func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position - position)/speed 
		move_and_slide()
		updateAnimation()

func updateAnimation():
		var direc = player.direction
		animations.play("walk"+direc)



func _on_hurtbux_area_entered(area: Area2D) -> void:
	if area.name == "Sword":
		count += 1
		$hitBox.set_deferred("monitorable", false)
		anime.play("death")
		isdead = true
		await anime.animation_finished
		queue_free()


func _on_detectionbox_body_entered(body: Node2D) -> void:
	if body is Detect:
		player = body
		player_chase = true


func _on_detectionbox_body_exited(body: Node2D) -> void:
	if body is Detect:
		player = body
		player_chase = true
