class_name EnemyTargetComponent
extends Node

var player : Player

func target_player() -> Player:
	player = get_tree().get_first_node_in_group('player') as Player
	return player
