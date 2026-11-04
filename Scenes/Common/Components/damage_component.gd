class_name DamageComponent
extends Node

var _body : Node2D

func setup(body):
	_body = body

func take_damage(damage : float):
	_body.hp -= damage
	if _body.hp <= 0:
		var payload := EventBus.EnemyDiedPayload.new()
		payload.global_position = _body.global_position
		payload.exp = _body.data._exp
		if _body.is_in_group('enemy'):
			EventBus.enemy_died.emit(payload)
		_body.queue_free()
