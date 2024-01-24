extends Node

class_name Damageable

@export var health : float = 20

func hit(damage : int):
	print("Health: " + str(health))
	health -= damage
	if( health <= 0):
		get_parent().queue_free()
