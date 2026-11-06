class_name Bullet
extends Node2D

var damage : float = 0.0
var dir : Vector2 = Vector2(0, 1)
var origin_global_position : Vector2
var speed : float = 300.0 # temp

@onready var movement_component: MovementComponent = %MovementComponent
@onready var hitbox_component: HitboxComponent = %HitboxComponent
@onready var visible_on_screen_enabler_2d: VisibleOnScreenEnabler2D = $VisibleOnScreenEnabler2D
@onready var hitbox_area_2d: Area2D = $HitboxArea2D
@export var is_player_hurtable : bool
func _ready() -> void:
	self.global_position = origin_global_position
	movement_component.setup(self)
	hitbox_component.setup(self, damage)
	visible_on_screen_enabler_2d.screen_exited.connect(
		func():
			queue_free()
	)

func _process(delta: float) -> void:
	movement_component.move(delta, dir, speed, true)
