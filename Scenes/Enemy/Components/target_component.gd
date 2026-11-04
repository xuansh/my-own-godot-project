class_name EnemyTargetComponent
extends Node

var player : Node2D

func target_player() -> Node2D:
	player = get_tree().get_first_node_in_group('player') as Node2D
	return player
