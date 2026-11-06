class_name Player
extends Entity

@export var weapon_definition : WeaponDefinition
@export var player_data : PlayerData

@onready var attack_timer: Timer = $AttackTimer
@onready var cooltime_progress_bar: ProgressBar = $CoolTimeProgressBar
@onready var magnet_area_2d: Area2D = $MagnetArea2D
@onready var hurtbox_area_2d: Area2D = $HurtboxArea2D

@onready var input_component : InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent
@onready var weapon_component: WeaponComponent = %WeaponComponent
@onready var magnet_component: MagnetComponent = %MagnetComponent
@onready var hurtbox_component: HurtboxComponent = %HurtboxComponent
@onready var damage_component: DamageComponent = %DamageComponent

func _ready() -> void:
	hp = player_data.max_hp
	speed = player_data.max_speed
	additional_bullet_count += player_data.additional_bullet_count

	movement_component.setup(self)
	weapon_component.setup(self, weapon_definition, attack_timer)
	magnet_component.setup(self)
	hurtbox_component.setup(self)
	damage_component.setup(self)

func _process(_delta: float) -> void:
	var input_dir := input_component.get_move_vector()
	movement_component.move(_delta, input_dir, speed)
	cooltime_progress_bar.value = weapon_component.get_cooltime_ratio()
