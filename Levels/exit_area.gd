extends Area2D

func _on_body_entered(body):
	queue_free()
	var ExitArea = get_tree().get_nodes_in_group("ExitArea")
	if ExitArea.size() == 1:
		Events.level_completed.emit()
		get_tree().change_scene_to_file("res://Levels/level_two.tscn")
		print("Level completed")
 
