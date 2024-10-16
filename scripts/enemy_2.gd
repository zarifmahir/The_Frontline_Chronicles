extends CharacterBody2D

var startPos
var endPos
@export var speed=50
@export var limit=0.5
@export var endPoint : Marker2D
@onready var animation = $AnimatedSprite2D

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
	updateVelocity()
	move_and_slide()
	updateAnimation()
