extends Node2D
#
@export var enemy_scenes: Array[PackedScene] = []
#
@export var road_scenes: Array[PackedScene] = []
@onready var player_spawn_pos = $PlayerSpawn
@onready var Car=$Car
#@onready var laser_container = $LaserContainer
@onready var timer =$SpawnTimer
@onready var enemy_container = $PoliceContainer

@onready var timer_road=$roadTimer
@onready var road_container=$roadContainer
var time_remaining = 60  
var game_over = false
@onready var label_timer=$Label
@onready var timer2 =$gameTime
#@onready var hud = $UILayer/HUD
#@onready var gos = $UILayer/GameOverScreen
#@onready var pb = $ParallaxBackground
#
#@onready var laser_sound = $SFX/LaserSound
#@onready var hit_sound = $SFX/HitSound
#@onready var explode_sound = $SFX/ExplodeSound
#


func _ready():

	timer2.wait_time = 1  # Set the timer to tick every second
	timer2.start()  # Start the timer

	
	Car.global_position = player_spawn_pos.global_position

#
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
	#


func _on_spawn_timer_timeout() -> void:
	var e = enemy_scenes.pick_random().instantiate()
	e.global_position = Vector2(230,randf_range(21,122))
	#e.killed.connect(_on_enemy_killed)
	#e.hit.connect(_on_enemy_hit)
	enemy_container.add_child(e)


func _on_game_time_timeout() -> void:
	if not game_over:
		time_remaining -= 1
		label_timer.text = str(time_remaining) + "s"
	if time_remaining <= 0:
		game_over = true
		label_timer.text = "You Win!"
		timer2.stop() 


#func _on_road_timer_timeout() -> void:
	#var f = road_container.pick_random().instantiate()
	#f.global_position = Vector2(256,72)
	##e.killed.connect(_on_enemy_killed)
	##e.hit.connect(_on_enemy_hit)
	#enemy_container.add_child(f)
