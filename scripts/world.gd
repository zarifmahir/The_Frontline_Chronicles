extends BaseScene

@onready var heartsContainer = $CanvasLayer/HeartsContainer

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
