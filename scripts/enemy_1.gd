extends CharacterBody2D

var startPos
var endPos
@export var speed= 50
@export var limit=0.5
@export var endPoint : Marker2D
@onready var animation = $AnimatedSprite2D
@onready var anime = $AnimationPlayer

var count: int = 0
var isdead: bool = false
func _ready():
	startPos =position
	endPos = endPoint.global_position
func changeDirection():
	var tempEnd=endPos
	endPos=startPos
	startPos=tempEnd
func updateAnimation():
	var animationString = "walkUp"
	if velocity.y>0:
		animationString="walkDown"
	animation.play(animationString)
func updateVelocity():
	var moveDirection = endPos-position
	if moveDirection.length()<limit:
		changeDirection()
	velocity = moveDirection.normalized()*speed

func _physics_process(delta):
	if isdead: return
	updateVelocity()
	move_and_slide()
	updateAnimation()


func _on_hurtbux_area_entered(area: Area2D) -> void:
	if area.name == "Sword":
		count += 1
		if count<2: return
		$hitBox.set_deferred("monitorable", false)
		anime.play("death")
		isdead = true
		await anime.animation_finished
		queue_free()
	
