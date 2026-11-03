extends Node2D

var dir : Vector2
var origin_global_position : Vector2
var speed : float = 300.0 # temp

@onready var movement_component: MovementComponent = %MovementComponent
@onready var visible_on_screen_enabler_2d: VisibleOnScreenEnabler2D = $VisibleOnScreenEnabler2D

func _ready() -> void:
	self.global_position = origin_global_position
	movement_component.setup(self)
	visible_on_screen_enabler_2d.screen_exited.connect(
		func():
			queue_free()
	)

func _process(delta: float) -> void:
	movement_component.move(dir, speed, delta)
