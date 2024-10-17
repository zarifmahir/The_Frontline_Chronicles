class_name SceneTrigger1 extends Area2D

@export var connected_scene: String
var scene_folder = "res://scenes/"

func _on_body_entered(body: Node2D) -> void:
	var full_path = scene_folder + connected_scene + ".tscn"
	#get_tree().call_deferred("change_scene_to_file", full_path)
	if body is Detect:
		Scene_Manager.change_scene(get_owner(), connected_scene)
	elif body is Detect2:
		get_tree().call_deferred("change_scene_to_file", full_path)
