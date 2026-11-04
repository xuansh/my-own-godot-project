class_name HitboxComponent
extends Node

var _body : Node2D
var damage : float = 0.0

func setup(body, p_damage):
	_body = body
	damage = p_damage

func attack(target):
	if target is Enemy and _body is Bullet:
		(target as Enemy).damage_component.take_damage(damage)
