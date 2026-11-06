class_name WeaponDefinition
extends Resource

@export var id : StringName = &"basic_weapon"
@export var weapon_name : String = "基础武器"
@export var bullet_scene : PackedScene
@export var is_melee_weapon : bool = false
@export var is_bullet_firing : bool = true
@export var basic_bullet_count : int = 1
@export var spread_angle : float = 0.0

@export_range(0.0, 1.0, 0.1, "攻击间隔")
var cool_time : float

@export_range(0.0, 1000.0, 1.0, "攻击伤害")
var damage : float
