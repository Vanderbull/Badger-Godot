extends Node2D

class_name GameWorld 

@export var mob_scene: PackedScene

signal toggle_game_paused(is_paused: bool)

var game_paused : bool  = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)
		
@export var next_level: PackedScene

@onready var level_completed = $CanvasLayer/LevelCompleted

# Called when the node enters the scene tree for the first time.
func _ready():
	print(ProjectSettings.get_setting("application/config/version"))
	
	var Mushroom = 0
	
	if(get_tree().get_nodes_in_group("LevelOne")):
		Mushroom = get_tree().get_nodes_in_group("Mushroom")
	else:
		Mushroom = get_tree().get_nodes_in_group("Mushroom")
		
	$CanvasLayer/MushroomCounter.text = "Mushrooms: " + str(Mushroom.size())
	get_tree().paused = false
	RenderingServer.set_default_clear_color(Color.BLACK)
	Events.level_completed.connect(show_level_completed)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _process(delta):
	var Mushroom = 0
	if(get_tree().get_nodes_in_group("LevelOne")):
		Mushroom = get_tree().get_nodes_in_group("Mushroom")
	else:
		Mushroom = get_tree().get_nodes_in_group("Mushroom")
	$CanvasLayer/MushroomCounter.text = "Mushrooms: " + str(Mushroom.size())
	
	if get_tree().get_nodes_in_group("LevelOne"):
			if Mushroom.size() == 0:
				print("Evaluating Mushroom size")
				Events.level_completed.emit()
				get_tree().change_scene_to_file("res://Levels/level_two.tscn")
	elif get_tree().get_nodes_in_group("LevelTwo"):
			if Mushroom.size() == 0:
				Events.level_completed.emit()
				
	
func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		game_paused = !game_paused


# Ending of the game
func show_level_completed():
	level_completed.show()
	await get_tree().create_timer(1.0).timeout
	level_completed.hide()
	get_tree().change_scene_to_file("res://Levels/level_one.tscn")
	#get_tree().reload_current_scene()
	#game_paused = !game_paused
	#get_tree().paused = true
	
	
func save():
	print("Level save called")
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
	}
	return save_dict


func _on_mob_timer_timeout():
# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
