class_name PointMovementComponent
extends MovementComponent

var follow_point : Vector2

func move(delta : float, dir : Vector2 = Vector2.ZERO, speed : float = 0.0, is_rotated_needed : bool=false):
	_body.global_position = follow_point
