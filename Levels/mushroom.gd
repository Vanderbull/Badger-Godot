extends Area2D

@onready var audio_player = $AudioStreamPlayer

func _on_body_entered(body):
	if get_tree().get_nodes_in_group("LevelOne"):
		var Mushroom = get_tree().get_nodes_in_group("Mushroom")
		print(Mushroom.size())
		audio_player.play()
		await audio_player.finished
		queue_free()
	
		if Mushroom.size() == 1:
			Events.level_completed.emit()
			get_tree().change_scene_to_file("res://Levels/level_two.tscn")			
	elif get_tree().get_nodes_in_group("LevelTwo"):
		var Mushroom = get_tree().get_nodes_in_group("Mushroom")
		print("Level 2: " + str(Mushroom.size()))
		audio_player.play()
		await audio_player.finished
		queue_free()
		#	$"../CanvasLayer/Label".text = "Mushrooms: " + str(Mushroom.size()-1)
		if Mushroom.size() == 1:
			Events.level_completed.emit()
		#	get_tree().change_scene_to_file("res://Levels/level_two.tscn")
			print("GAME OVER!!!")
	else:
		print("There is nothing todo!")	
