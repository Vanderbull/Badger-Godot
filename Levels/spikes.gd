extends Area2D

@onready var audio_player = $AudioStreamPlayer

func _on_body_entered(_body):
	get_tree().reload_current_scene()
	return
	print("Spikes body entered")
	if get_tree().get_nodes_in_group("LevelOne"):
		print("Are where anytime soon")
		audio_player.play()
		await audio_player.finished
		queue_free()
		var Spikes = get_tree().get_nodes_in_group("LevelOne")
		print("Spikes: ", Spikes.size())
		$"../CanvasLayer/Label4".text = "Spikes(one): " + str(Spikes.size()-1)
	
		if Spikes.size() == 2:
			print("Evaluating Spikes size")
			Events.level_completed.emit()
			get_tree().change_scene_to_file("res://Levels/level_two.tscn")
	elif get_tree().get_nodes_in_group("LevelTwo"):
		var Spikes = get_tree().get_nodes_in_group("LevelTwo")
		print("Level 2: " + str(Spikes.size()-1))
		audio_player.play()
		await audio_player.finished
		queue_free()
		$"../CanvasLayer/Label4".text = "Spikes(two): " + str(Spikes.size()-1)
		if Spikes.size() == 2:
			Events.level_completed.emit()
		#	get_tree().change_scene_to_file("res://Levels/level_two.tscn")
			print("GAME OVER!!!")
	else:
		print("There is nothing todo!")	
