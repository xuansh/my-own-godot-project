## 吸取别人的组件
class_name MagnetComponent
extends Node

var _body : Node2D

func setup(body : Node2D):
	_body = body
	if _body.is_in_group('player'):
		(_body as Player).magnet_area_2d.area_entered.connect(_on_magnet_area_2d_area_enter)

func _on_magnet_area_2d_area_enter(area : Area2D):
	var player := _body as Player
	if player == null:
		return
	if area.get_owner() is XpGem:
		var magnet_target = area.get_owner().magnet_target_component as MagnetTargetComponent
		magnet_target.set_target(_body)
