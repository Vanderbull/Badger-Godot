extends RemoteTransform2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Ready RemoteTransform2D")


func save():
	print("RemoteTransform2D saved")
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, # Vector2 is not supported by JSON
		"pos_y" : position.y,
		"groups" : get_groups(),
	}
	return save_dict
