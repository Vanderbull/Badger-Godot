extends Area2D

@export var damage : int = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print(body.name + " entered TheRoom")
	for child in body.get_children():
		if child is Damageable:
			print("Damageable")
			child.hit(damage)
			print_debug(body.name + " took " + str(damage) + ".")
