class_name BaseScene extends Node

@onready var player: Detect = $Detective
@onready var entrancemarkers: Node2D = $EntranceMarkers
@onready var sund = $AudioStreamPlayer2D

func _ready() -> void:
	if Scene_Manager.player:
		if player:
			player.queue_free()
		
		player = Scene_Manager.player
		add_child(player)
		
	position_player()

func position_player():
	var last_scene = Scene_Manager.last_scene_name
	if last_scene.is_empty():
		last_scene = "any"
	for entrance in entrancemarkers.get_children():
		if entrance is Marker2D and entrance.name == "any" or entrance.name == last_scene:
			player.global_position = entrance.global_position
			
	
