extends Area2D
class_name Enemy
var hp : float
var max_hp : float
var speed : float
var player : CharacterBody2D = null

@export var data : EnemyData
@onready var enemy_target_component: EnemyTargetComponent = %EnemyTargetComponent
@onready var movement_component: MovementComponent = %MovementComponent

func _ready() -> void:
	if data == null:
		push_error("Enemy 缺少 EnemyData")
		return
	position.x = randi_range(-300, 300)
	position.y = randi_range(-200, 200)
	max_hp = data.max_hp
	hp = max_hp
	
	movement_component.set_max_speed(data.max_speed)
	movement_component.setup(self)
	player = enemy_target_component.target_player()

func _process(delta: float) -> void:
	if player == null:
		return
	var dir := global_position.direction_to(player.global_position)
	movement_component.move(dir, delta)

func take_damage(damage : float):
	hp -= damage
	if hp <= 0:
		var payload := EventBus.EnemyDiedPayload.new()
		payload.global_position = global_position
		payload.exp = data._exp
		EventBus.enemy_died.emit(payload)
		queue_free()
		
