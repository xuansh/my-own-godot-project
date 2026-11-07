class_name Entity
extends Node2D

var hp : float : 
	set(value):
		hp = value	
		if self is Player:
			EventBus.player_hp_changed.emit()
			print('player hp changed')
var speed : float

## 玩家额外的武器子弹数
var additional_bullet_count : int = 0
