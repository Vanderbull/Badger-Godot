extends Control

@export var game_world : GameWorld

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	game_world.connect("toggle_game_paused", _on_game_world_toggle_game_paused)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_game_world_toggle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()


func _on_resume_pressed():
	game_world.game_paused = false


func _on_exit_pressed():
	get_tree().quit()
