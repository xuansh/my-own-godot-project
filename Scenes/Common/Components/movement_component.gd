class_name MovementComponent
extends Node

var _body : Node2D

func setup(body : Node2D):
	_body = body

func move(dir : Vector2, speed : float, delta : float):
	var move_direction := dir.limit_length(1)
	_body.global_position += move_direction * speed * delta
