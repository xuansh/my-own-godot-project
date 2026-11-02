extends Node2D
#  InputComponent
# → MovementComponent
# → TargetingComponent
  #→ WeaponComponent
  #→ DamageData
  #→ HealthComponent
  #→ Hurtbox
  #→ 死亡信号
  #→ EncounterController 生成经验宝石
@onready var player: CharacterBody2D = $Player

var enemy : PackedScene = preload("res://Scenes/Enemy/enemy.tscn")
var xp_gem : PackedScene = preload("res://Scenes/XpGem/xp_gem.tscn")

func _ready() -> void:
	EventBus.enemy_died.connect(on_enemy_died)

	for i in range(10):
		var node = enemy.instantiate()
		add_child(node)

func _process(delta: float) -> void:
	RunState.tick(delta)

func on_enemy_died(payload : EventBus.EnemyDiedPayload):
	var gem = xp_gem.instantiate() as Area2D
	add_child(gem)
	gem.global_position = payload.global_position
