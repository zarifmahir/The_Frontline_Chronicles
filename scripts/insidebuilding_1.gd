extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Scene_Manager.layer:
		add_child(Scene_Manager.layer)
