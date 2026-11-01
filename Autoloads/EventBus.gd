extends Node2D
@warning_ignore_start("unused_signal")

class EnemyDiedPayload:
	var global_position : Vector2
	var exp : int
signal enemy_died(payload : EnemyDiedPayload)

signal xp_gained
signal level_up
signal run_ended
