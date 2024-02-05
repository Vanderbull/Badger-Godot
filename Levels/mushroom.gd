extends Area2D

@export var damage : int = 10

@onready var audio_player = $AudioStreamPlayer

func _on_body_entered(body):
	print(body.name + " entered Shroom")

	if get_tree().get_nodes_in_group("LevelOne"):
		if body.name == "Player":
			audio_player.play()
			await audio_player.finished
			queue_free()
			var Mushroom = get_tree().get_nodes_in_group("Mushroom")
			$"../CanvasLayer/MushroomCounter".text = "Mushrooms: " + str(Mushroom.size())
	
			#if Mushroom.size() == 0:
				#print("Evaluating Mushroom size")
				#Events.level_completed.emit()
				#get_tree().change_scene_to_file("res://Levels/level_two.tscn")
	elif get_tree().get_nodes_in_group("LevelTwo"):
		if body.name == "Player":
			audio_player.play()
			await audio_player.finished
			queue_free()
			var Mushroom = get_tree().get_nodes_in_group("Mushroom")
			$"../CanvasLayer/MushroomCounter".text = "Mushrooms: " + str(Mushroom.size())
			if Mushroom.size() == 0:
				Events.level_completed.emit()
				print("GAME OVER!!!")
	else:
		print("There is nothing todo!")	
