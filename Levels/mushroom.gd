extends Area2D

@export var damage : int = 10

@onready var audio_player = $AudioStreamPlayer

func _on_body_entered(body):
	
	print(body.name + " entered Shroom")
	#for child in body.get_children():
		#if child is Damageable:
			#print("Damageable")
			#child.hit(damage)
			#print_debug(body.name + " took " + str(damage) + ".")

	if get_tree().get_nodes_in_group("LevelOne"):
		if body.name == "Player":
			audio_player.play()
			await audio_player.finished
			queue_free()
			var Mushroom = get_tree().get_nodes_in_group("LevelOne")
			print("Mushrooms: ", Mushroom.size())
			$"../CanvasLayer/Label".text = "Mushrooms(one): " + str(Mushroom.size()-1)
	
			if Mushroom.size() == 2:
				print("Evaluating Mushroom size")
				Events.level_completed.emit()
				get_tree().change_scene_to_file("res://Levels/level_two.tscn")
	elif get_tree().get_nodes_in_group("LevelTwo"):
		var Mushroom = get_tree().get_nodes_in_group("LevelTwo")
		print("Level 2: " + str(Mushroom.size()-1))
		audio_player.play()
		await audio_player.finished
		queue_free()
		$"../CanvasLayer/Label".text = "Mushrooms(two): " + str(Mushroom.size()-1)
		if Mushroom.size() == 2:
			Events.level_completed.emit()
		#	get_tree().change_scene_to_file("res://Levels/level_two.tscn")
			print("GAME OVER!!!")
	else:
		print("There is nothing todo!")	
