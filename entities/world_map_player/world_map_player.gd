extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 120.0


func _physics_process(delta: float) -> void:


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity = Vector2.ZERO
		
	if velocity.x < 0.0:
		animated_sprite_2d.scale.x = -1.0
	elif velocity.x > 0.0:
		animated_sprite_2d.scale.x = 1.0
		

	move_and_slide()
