extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -250.0

@onready var sprite: AnimatedSprite2D = $Sprite

var allowed_to_climb: bool = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and not allowed_to_climb:
		velocity += get_gravity() * delta
	elif allowed_to_climb:
		velocity.y = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		sprite.play("run")
		
		if direction < 0:
			sprite.flip_h = true
		if direction > 0:
			sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sprite.play("idle") 
		
	if not is_on_floor():
		sprite.play("jump")
	
	move_and_slide()


func _on_climb_area_entered(area: Area2D) -> void:
	print("Allowed to climb")
	allowed_to_climb = true


func _on_climb_area_exited(area: Area2D) -> void:
	allowed_to_climb = false
