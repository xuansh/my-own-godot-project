class_name MovementComponent
extends Node

var _body : Node2D

func setup(body : Node2D):
	_body = body

func move(delta : float, dir : Vector2 = Vector2.ZERO, speed : float = 0.0, is_rotated_needed : bool=false):
	var move_direction := dir.limit_length(1)
	if is_rotated_needed:
		_body.look_at(_body.global_position + dir)
	_body.global_position += move_direction * speed * delta
