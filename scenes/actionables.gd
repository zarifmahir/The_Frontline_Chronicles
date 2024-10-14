extends Area2D


# Called when the node enters the scene tree for the first time.
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String="start"

var active=false

func action()-> void:
	#if !active:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource,dialogue_start)
		#active =true
	
#func _on_timer_timeout() -> void:
	#$Timer.wait_time=1
	#active=false


	
