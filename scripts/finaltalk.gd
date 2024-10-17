extends Control

@onready var sund: AudioStreamPlayer2D = $AudioStreamPlayer2D
func _ready() -> void:
	sund.play(0)
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/funeral.tscn")
