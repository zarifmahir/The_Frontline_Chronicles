extends Node2D

@onready var player = $Detective
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Scene_Manager.player:
		add_child(Scene_Manager.player)
