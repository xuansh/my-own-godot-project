class_name HurtboxComponent
extends Node

var _body : Node2D

func setup(body : Node2D):
	_body = body
	_body.hurtbox_area_2d.area_entered.connect(_on_area_entered)
	
func _on_area_entered(area : Area2D):
	if area.get_owner() is Bullet and _body is Enemy:
		(area.get_owner() as Bullet).hitbox_component.attack(_body)
