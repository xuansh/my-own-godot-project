extends CharacterBody2D

@export var speed : float = 150.0
@export var weapon_definition : WeaponDefinition

@onready var attack_timer: Timer = $AttackTimer
@onready var input_component : InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent
@onready var weapon_component: WeaponComponent = %WeaponComponent

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	movement_component.setup(self)
	weapon_component.setup(self, weapon_definition, attack_timer)

func _process(_delta: float) -> void:
	var input_dir := input_component.get_move_vector()
	movement_component.move(input_dir, _delta)
