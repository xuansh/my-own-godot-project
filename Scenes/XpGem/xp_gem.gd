class_name XpGem
extends Node2D

var speed : float = 200

@onready var movement_component: MovementComponent = %MovementComponent
@onready var magnet_target_component: MagnetTargetComponent = %MagnetTargetComponent

@onready var collision_shape_2d: CollisionShape2D = $MagnetTargetArea2D/CollisionShape2D

func _ready() -> void:
	movement_component.setup(self)
	magnet_target_component.setup(self, movement_component)

func _process(delta: float) -> void:
	magnet_target_component.tick(delta)
