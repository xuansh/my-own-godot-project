class_name Player
extends Node2D

@export var weapon_definition : WeaponDefinition
@export var player_data : PlayerData
var hp : float
var speed : float

@onready var attack_timer: Timer = $AttackTimer
@onready var cooltime_progress_bar: ProgressBar = $CoolTimeProgressBar
@onready var xp_gem_collision_shape_2d: CollisionShape2D = $XpGemPickupArea2D/CollisionShape2D

@onready var input_component : InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent
@onready var weapon_component: WeaponComponent = %WeaponComponent

func _ready() -> void:
	hp = player_data.max_hp
	speed = player_data.max_speed
	if xp_gem_collision_shape_2d.shape is CircleShape2D:
		xp_gem_collision_shape_2d.shape.radius = player_data.xp_gem_pickup_range
	
	movement_component.setup(self)
	weapon_component.setup(self, weapon_definition, attack_timer)

func _process(_delta: float) -> void:
	var input_dir := input_component.get_move_vector()
	movement_component.move(input_dir, speed, _delta)
	cooltime_progress_bar.value = weapon_component.get_cooltime_ratio()
