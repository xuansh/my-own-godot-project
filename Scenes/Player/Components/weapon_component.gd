class_name WeaponComponent
extends Node

var _body : Node2D
var weapon_definition : WeaponDefinition
var _timer : Timer

func setup(body, defi : WeaponDefinition, timer : Timer):
	weapon_definition = defi
	_body = body
	_timer = timer
	timer.wait_time = weapon_definition.cool_time
	timer.one_shot = false
	timer.timeout.connect(attack)
	timer.start()

func attack():
	var enemies = get_tree().get_nodes_in_group('enemy') as Array[Enemy]
	var min_distance : float = INF
	var closest_enemy : Enemy
	for enemy in enemies:
		var distance = _body.global_position.distance_squared_to(enemy.global_position)
		if distance < min_distance:
			min_distance = distance
			closest_enemy = enemy
	if closest_enemy:
		var dir = _body.global_position.direction_to(closest_enemy.global_position)
		var bullet = weapon_definition.bullet_scene.instantiate() as Bullet
		if bullet:
			bullet.dir = dir
			bullet.origin_global_position = _body.global_position
			bullet.damage = weapon_definition.damage
		get_tree().get_first_node_in_group('bullet_container').add_child(bullet)

func get_cooltime_ratio() -> float:
	if _timer == null or _timer.wait_time <= 0:
		return 1.0
	return 1.0 - (_timer.time_left / _timer.wait_time)
