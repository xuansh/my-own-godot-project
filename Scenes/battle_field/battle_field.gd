extends Node2D

@onready var player: CharacterBody2D = $Player
var enemy : PackedScene = preload("res://Scenes/Enemy/enemy.tscn")

func _ready() -> void:
	for i in range(5):
		var node = enemy.instantiate()
		node.player = player
		add_child(node)
