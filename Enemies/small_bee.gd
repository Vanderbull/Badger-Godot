extends Area2D

const GameOverScreen = preload("res://UI/game_over_screen.tscn")

@export var move_speed : float = 30.0
@export var move_dir : Vector2

var start_pos : Vector2
var target_pos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = global_position
	target_pos = start_pos + move_dir


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(target_pos, move_speed * delta)

	if global_position == target_pos:
		if global_position == start_pos:
			target_pos = start_pos + move_dir
		else:
			target_pos = start_pos


func _on_body_entered(body):
	if body.is_in_group("Player"):
		var game_over = GameOverScreen.instantiate()
		add_child(game_over)
		#body.queue_free()

