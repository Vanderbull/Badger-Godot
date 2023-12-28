extends Area2D

func _on_body_entered(body):
	$"../CanvasLayer/Control/ending".show()
	$"../CanvasLayer/Control/ending".text = str(1)
	$"../CanvasLayer/Control/ending".show()
	queue_free()
	get_tree().change_scene_to_file("res://Levels/test_level2.tscn")
