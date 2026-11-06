## 可以被吸取的组件
class_name MagnetTargetComponent
extends Node

var _body : Node2D
var _target : Entity
var _movement_component : MovementComponent
@export_range(0.0, 1000.0, 20)
var speed : float

func setup(body : Node2D, movement : MovementComponent):
	_body = body
	_movement_component = movement

func set_target(target : Entity):
	_target = target


func tick(delta : float):
	if _target == null:
		return
	
	var dir = _body.global_position.direction_to(_target.global_position)
	_movement_component.move(delta, dir, speed)
	if _body.global_position.distance_squared_to(_target.global_position) < 100.0:
		_target = null
		if _body is XpGem:
			RunState.add_xp(_body.exp)
		_body.queue_free()
