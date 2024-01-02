extends Node2D

@export var scene_to_load : PackedScene

const GameOverScreen = preload("res://UI/game_over_screen.tscn")
@export var delay : float = 200.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = 2
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_timer_timeout():
	#var game_over = GameOverScreen.instantiate()
	#add_child(game_over)
	print("Timer stopped")


func _on_check_button_toggled(_toggled_on):
	get_tree().change_scene_to_packed(scene_to_load)
