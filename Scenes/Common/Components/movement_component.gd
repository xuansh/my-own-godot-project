class_name MovementComponent
extends Node

var _body : Node2D

@export_range(0.0, 200.0)
var max_speed : float

func setup(body : Node2D):
	_body = body

func move(dir : Vector2, delta : float):
	var move_direction := dir.limit_length(1)
	_body.global_position += move_direction * max_speed * delta

# 设置最大移动速度
func set_max_speed(speed : float):
	max_speed = speed
