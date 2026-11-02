class_name WeaponComponent
extends Node

var _body : Node2D
var weapon_definition : WeaponDefinition

func setup(body, defi : WeaponDefinition, timer : Timer):
	weapon_definition = defi
	_body = body
	print(weapon_definition.cool_time)
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
		closest_enemy.take_damage(weapon_definition.damage)
