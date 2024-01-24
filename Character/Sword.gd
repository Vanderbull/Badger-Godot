extends Area2D

@export var damage : int = 10

func _ready():
	monitoring = false
	visible = false
	
func _on_body_entered(body):
	print_debug(body.name + " entered.")
	for child in body.get_children():
		if child is Damageable:
			child.hit(damage)
			print_debug(body.name + " tooker " + str(damage) + ".")
