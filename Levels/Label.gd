extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(get_tree().get_nodes_in_group("LevelOne")):
		var Mushroom = get_tree().get_nodes_in_group("LevelOne")
		text = "Mushrooms(one): " + str(Mushroom.size()-1)
	if(get_tree().get_nodes_in_group("LevelTwo")):
		var Mushroom = get_tree().get_nodes_in_group("LevelTwo")
		text = "Mushrooms(two): " + str(Mushroom.size()-1)
	
		

