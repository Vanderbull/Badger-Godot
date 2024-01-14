extends Node2D

class_name GameWorld 

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
	#var Mushroom = get_tree().get_nodes_in_group("LevelOne")
	#$CanvasLayer/Label.text = "Mushrooms: " + str(Mushroom.size())
	get_tree().paused = false
	RenderingServer.set_default_clear_color(Color.BLACK)
	Events.level_completed.connect(show_level_completed)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		game_paused = !game_paused


# Ending of the game
func show_level_completed():
	level_completed.show()
	get_tree().paused = true

