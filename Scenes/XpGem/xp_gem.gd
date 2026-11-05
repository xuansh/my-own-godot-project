extends Area2D

var _chasing = false
var speed : float = 200

@onready var movement_component: MovementComponent = %MovementComponent

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)
	movement_component.setup(self)

func _on_area_entered(area : Area2D):
	if area.get_owner():
		if area.get_owner().is_in_group('player'):
			_chasing = true

func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group('player') as Node2D
	if _chasing:
		var dir = global_position.direction_to(player.global_position)
		movement_component.move(dir, speed, delta)
	if global_position.distance_squared_to(player.global_position) < 100.0:
		queue_free()
