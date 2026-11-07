class_name HitboxComponent
extends Node

var _body : Node2D
var damage : float = 0.0

func setup(body, p_damage):
	_body = body
	damage = p_damage

func attack(target):
	if _body is Bullet:
		target.damage_component.take_damage(damage)
		if _body is Player:
			print(_body)
