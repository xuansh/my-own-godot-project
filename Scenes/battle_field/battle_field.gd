extends Node2D

@onready var player: CharacterBody2D = $Player
var enemy : PackedScene = preload("res://Scenes/Enemy/enemy.tscn")

func _ready() -> void:
	for i in range(10):
		var node = enemy.instantiate()
		add_child(node)

func _process(delta: float) -> void:
	RunState.tick(delta)
