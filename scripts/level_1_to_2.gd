extends Control

@onready var sd: AudioStreamPlayer2D = $AudioStreamPlayer2D
func _ready() -> void:
	sd.play()
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/station.tscn")
