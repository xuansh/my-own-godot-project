extends Node
@warning_ignore_start("unused_signal")

class EnemyDiedPayload:
	var global_position : Vector2
	var exp : int
signal enemy_died(payload : EnemyDiedPayload)

class PlayerHPPayload:
	var hp : float
	var max_hp : float

class PlayerHPChangedPayload extends PlayerHPPayload:
	pass
signal player_hp_changed(payload : PlayerHPChangedPayload)

signal xp_gained
signal level_up
signal run_ended
