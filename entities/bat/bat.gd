extends Node2D

var speed : float = 20.0
@onready var raycast_right: RayCast2D = $RaycastRight
@onready var raycast_left: RayCast2D = $RaycastLeft
var direction : int = 1


func _process(delta: float) -> void:
	if raycast_right.is_colliding():
		direction = -1
	if raycast_left.is_colliding():
		direction = 1
	
	position.x += direction * speed * delta
