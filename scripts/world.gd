extends BaseScene

#@onready var pause_menu: Control = $PauseMenu
@onready var heartsContainer = $CanvasLayer/HeartsContainer
var paused = false
#@onready var camera = $Followcam
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	#camera.follow_node = player
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthchanged.connect(heartsContainer.updateHearts)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#if Input.is_action_just_pressed("pause"):
		#pauseMenu()
		
#func pauseMenu():
	#if paused:
		#pause_menu.hide()
		#Engine.time_scale = 1
	#else:
		#pause_menu.show()
		#Engine.time_scale = 0
		#
	#paused = !paused
