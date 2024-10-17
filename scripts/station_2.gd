extends Node2D

@onready var heartsContainer = $CanvasLayer/HeartsContainer
@onready var player: Detect = $Detective
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	heartsContainer.setMxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthchanged.connect(heartsContainer.updateHearts)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
