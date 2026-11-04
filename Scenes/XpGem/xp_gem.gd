extends Area2D

var _chasing = false
var speed : float = 200


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		_chasing = true

func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group('player') as Node2D
	if _chasing:
		var dir = global_position.direction_to(player.global_position)
		global_position += dir * speed * delta
	if global_position.distance_squared_to(player.global_position) < 100.0:
		queue_free()
