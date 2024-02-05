extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(get_tree().get_nodes_in_group("LevelOne")):
		var TreasureChest = get_tree().get_nodes_in_group("TreasureChest")
		text = "TreasureChests: " + str(TreasureChest.size())
	if(get_tree().get_nodes_in_group("LevelTwo")):
		var TreasureChest = get_tree().get_nodes_in_group("TreasureChest")
		text = "TreasureChests: " + str(TreasureChest.size())
	
		

