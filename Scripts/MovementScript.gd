extends CharacterBody2D

# Variables for movement
var max_speed: float = 16000.0        # Maximum speed of the car
var acceleration: float = 800.0     # How fast the car accelerates
var deceleration: float = 1000.0    # How fast the car decelerates when braking
var friction: float = 300.0         # How fast the car slows down on its own (friction)
var turn_speed: float = 4.0         # How fast the car can turn

# Variables for steering
var steering: float = 0.0           # Rotation for steering
var current_speed: float = 0.0      # Current speed of the car

func get_input() -> void:
	# Steering left and right
	if Input.is_action_pressed("ui_left"):
		steering = -turn_speed
	elif Input.is_action_pressed("ui_right"):
		steering = turn_speed
	else:
		steering = 0.0
	
	# Acceleration (forward)sdwadsd
	if Input.is_action_pressed("ui_up"):
		current_speed += acceleration * get_physics_process_delta_time()
		current_speed = clamp(current_speed, 0, max_speed)
	# Braking (backward)
	elif Input.is_action_pressed("ui_down"):
		current_speed -= deceleration * get_physics_process_delta_time()
		current_speed = max(current_speed, 0)  # Ensure speed doesn't go negative
	# No input: apply friction to decelerate
	else:
		current_speed -= friction * get_physics_process_delta_time()
		current_speed = max(current_speed, 0)  # Ensure speed doesn't go negative

func _physics_process(delta: float) -> void:
	get_input()
	print("Current speed: ", current_speed)
	print("Accel gain: ", acceleration)
	
	# Rotate the car based on steering input
	rotation += steering * delta

	# Apply the movement in the forward direction relative to the car's rotation
	var forward_direction = Vector2.UP.rotated(rotation)  # Forward direction relative to the car's current rotation
	velocity = forward_direction * current_speed

	# Use the built-in velocity to move the car
	move_and_slide()
