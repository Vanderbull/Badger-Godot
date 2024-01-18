extends Resource

@export var speed : float
@export var jump_velocity : float
@export var double_jump_velocity : float

@export var health: int
@export var sub_resource: Resource
@export var strings: PackedStringArray

# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_speed = 200.0, p_jump_velocity = -150.0, p_double_jump_velocity = -100.0,p_health = 0, p_sub_resource = null, p_strings = []):
	print("Init stats")
	speed = p_speed
	jump_velocity = p_jump_velocity
	double_jump_velocity = p_double_jump_velocity
	health = p_health
	sub_resource = p_sub_resource
	strings = p_strings
	
func _ready():
	print("Ready stats")
