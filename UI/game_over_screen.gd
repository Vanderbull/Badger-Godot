extends CanvasLayer




func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")


func _on_quit_pressed():
	get_tree().quit()
