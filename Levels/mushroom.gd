extends Area2D

func _on_body_entered(body):
	queue_free()
	var Mushroom = get_tree().get_nodes_in_group("LevelOne")
	print(Mushroom.size())
	$"../CanvasLayer/Label".text = "Mushrooms: " + str(Mushroom.size()-1)
	if Mushroom.size() == 1:
		Events.level_completed.emit()
		get_tree().change_scene_to_file("res://Levels/level_two.tscn")
		print("Level completed")
		
