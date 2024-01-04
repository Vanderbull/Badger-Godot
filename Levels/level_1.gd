extends Node2D

const GameOverScreen = preload("res://UI/game_over_screen.tscn")
@export var delay : float = 200.0
@export var scene_to_load : PackedScene


func _on_check_button_toggled(_toggled_on):
	get_tree().change_scene_to_packed(scene_to_load)


