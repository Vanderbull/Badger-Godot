extends Area2D

@onready var audio_player = $AudioStreamPlayer

func _on_body_entered(_body):
	print("TreasureChest body entered")
	if get_tree().get_nodes_in_group("LevelOne"):
		print("Are where anytime soon")
		audio_player.play()
		await audio_player.finished
		queue_free()
		var TreasureChest = get_tree().get_nodes_in_group("LevelTwo")
		print("TreasueChest: ", TreasureChest.size())
		$"../CanvasLayer/Label3".text = "TreasureChest(one): " + str(TreasureChest.size()-1)
	
		if TreasureChest.size() == 2:
			print("Evaluating TreasureChest size")
			Events.level_completed.emit()
			get_tree().change_scene_to_file("res://Levels/level_two.tscn")
	elif get_tree().get_nodes_in_group("LevelTwo"):
		var TreasureChest = get_tree().get_nodes_in_group("LevelTwo")
		print("Level 2: " + str(TreasureChest.size()-1))
		audio_player.play()
		await audio_player.finished
		queue_free()
		$"../CanvasLayer/Label3".text = "TreasureChest(two): " + str(TreasureChest.size()-1)
		if TreasureChest.size() == 2:
			Events.level_completed.emit()
		#	get_tree().change_scene_to_file("res://Levels/level_two.tscn")
			print("GAME OVER!!!")
	else:
		print("There is nothing todo!")	
