extends CharacterBody2D


const SPEED = 30.0
const JUMP_VELOCITY = -400.0
var attack_started = false
var direction: int = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	#velocity.x = 300
	pass
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	if Globals.Monkey <= 0:
		Globals.Monkey = randi_range(0,150)
		direction = randi_range(-1,1)
		print("Direction set = ",direction)
		print("Ticks set = ",Globals.Monkey)

	if direction == 1 && Globals.Monkey > 0:
		velocity.x = SPEED
		print("RIGHT")
	elif direction == -1 && Globals.Monkey > 0:
		print("LEFTs")
		velocity.x = -SPEED
	else:
		print("IDLE")
		velocity.x = 0
	
	Globals.Monkey -= 1
	print("Ticks set = ",Globals.Monkey)
	move_and_slide()
