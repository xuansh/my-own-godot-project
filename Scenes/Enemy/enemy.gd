class_name Enemy
extends Entity

var player : Player = null

@export var data : EnemyData
@onready var enemy_target_component: EnemyTargetComponent = %EnemyTargetComponent
@onready var movement_component: MovementComponent = %MovementComponent
@onready var damage_component: DamageComponent = %DamageComponent
@onready var hurtbox_component: HurtboxComponent = %HurtboxComponent
@onready var weapon_component: WeaponComponent = %WeaponComponent

@export var weapon_definition : WeaponDefinition
@onready var hurtbox_area_2d: Area2D = $HurtboxArea2D
@onready var hitbox_area_2d: Area2D = $HitboxArea2D
@onready var attack_timer: Timer = $AttackTimer

func _ready() -> void:
	if data == null:
		push_error("Enemy 缺少 EnemyData")
		return
	position.x = randi_range(-300, 300)
	position.y = randi_range(-200, 200)
	hp = data.max_hp
	speed = data.max_speed
	additional_bullet_count = data.additional_bullet_count

	movement_component.setup(self)
	hurtbox_component.setup(self)
	weapon_component.setup(self, weapon_definition, attack_timer)
	damage_component.setup(self)

	player = enemy_target_component.target_player()

func _process(delta: float) -> void:
	if player == null:
		return
	var dir := global_position.direction_to(player.global_position)
	movement_component.move(delta, dir, speed)
