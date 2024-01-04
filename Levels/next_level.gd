extends Area2D

@export var scene_to_load = PackedScene

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("collided wih player")
		get_tree().change_scene_to_file("res://Levels/level_2.tscn")
