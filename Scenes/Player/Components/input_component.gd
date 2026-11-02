class_name InputComponent
extends Node

@export var move_left : StringName = &"KeyBoard-A"
@export var move_right : StringName = &"KeyBoard-D"
@export var move_up : StringName = &"KeyBoard-W"
@export var move_down : StringName = &"KeyBoard-S"

func get_move_vector() -> Vector2:
	return Input.get_vector(move_left, move_right, move_up, move_down)
