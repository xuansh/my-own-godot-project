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
	timer.timeout.connect(fire)
	timer.start()

func fire():
	var fire_targets : Array[Node2D]
	if _body is Player:
		fire_targets.assign(get_tree().get_nodes_in_group('enemy'))
	elif _body is Enemy:
		fire_targets.assign(get_tree().get_nodes_in_group('player'))
	var min_distance : float = INF
	var closest_target : Node2D
	for target in fire_targets:
		var distance = _body.global_position.distance_squared_to(target.global_position)
		if distance < min_distance:
			min_distance = distance
			closest_target = target
	if closest_target:
		var dir : Vector2
		if not weapon_definition.is_melee_weapon:
			dir = _body.global_position.direction_to(closest_target.global_position)
		else:
			dir = _body.global_transform.x.normalized()
		var bullet = weapon_definition.bullet_scene.instantiate() as Bullet
		if bullet:
			bullet.dir = dir
			bullet.origin_global_position = _body.global_position
			bullet.damage = weapon_definition.damage
			if bullet is MeleeBullet:
				bullet.follow_node = _body
		get_tree().get_first_node_in_group('bullet_container').add_child(bullet)

func get_cooltime_ratio() -> float:
	if _timer == null or _timer.wait_time <= 0:
		return 1.0
	return 1.0 - (_timer.time_left / _timer.wait_time)
