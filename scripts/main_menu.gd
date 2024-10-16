class_name MainMenu
extends Control


@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/Play as Button
@onready var options_button = $MarginContainer/HBoxContainer/VBoxContainer/Options as Button
@onready var options_menu: Control = $Options_menu as OptionsMenu
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/Quit as Button
@onready var margin_container: MarginContainer = $MarginContainer as MarginContainer

@onready var start_level = preload("res://scenes/world.tscn") as PackedScene

func _ready():
	handle_connecting_signals()
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_options_pressed() -> void: 
	margin_container.visible = false
	options_menu.set_process 
	options_menu.visible = true;
	
func on_exit_pressed() -> void:
	get_tree().quit()
	

func on_exit_options_menu() -> void:
	margin_container.visible = true
	options_menu.visible = false

func handle_connecting_signals() -> void:
	start_button.button_down.connect(on_start_pressed)
	options_button.button_down.connect(on_options_pressed)
	exit_button.button_down.connect(on_exit_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_menu)
