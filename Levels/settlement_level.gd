extends Area2D

func _on_body_entered(_body):
	$"../CanvasLayer/Control/ending".show()
	$"../CanvasLayer/Control/ending".text = str(1)
	queue_free()
	get_tree().change_scene_to_file("res://Levels/mountains_level.tscn")

