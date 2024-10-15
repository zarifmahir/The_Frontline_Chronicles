extends Node


var scene_dir_path = "res://scenes/"
var layer
func change_scene(from, to_scene_name: String) -> void:
	layer = from.player
	layer.get_parent().remove_child(layer)
	
	var full_path = scene_dir_path + to_scene_name + ".tscn"
	from.get_tree().call_deferred("change_scene_to_file", full_path)
	
