class_name EnemyTargetComponent
extends Node

var player : CharacterBody2D

func target_player() -> CharacterBody2D:
	player = get_tree().get_first_node_in_group('player') as CharacterBody2D
	return player
