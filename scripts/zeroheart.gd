extends Control


func _on_button_2_pressed() -> void:
	var lastScene = Scene_Manager.last_scene_name
	var full_path = "res://scenes/" + lastScene + ".tscn"
	get_tree().change_scene_to_file(full_path)
	

func _on_button_pressed() -> void:
	get_tree().quit()
