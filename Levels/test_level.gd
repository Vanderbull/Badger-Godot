extends Node2D

@export var delay : float = 200.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = 2
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout():
	print("Timer stopped")
