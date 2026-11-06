class_name MeleeBullet
extends Bullet


var follow_node : Node2D

func _ready() -> void:
	movement_component = %PointMovementComponent as PointMovementComponent
	self.global_position = origin_global_position
	movement_component.setup(self)
	hitbox_component.setup(self, damage)
	await get_tree().create_timer(0.1).timeout
	queue_free()

func _process(delta: float) -> void:
	if is_instance_valid(follow_node):
		(movement_component as PointMovementComponent).follow_point = follow_node.global_position
		(movement_component as PointMovementComponent).move(delta)
