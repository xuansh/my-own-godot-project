extends CharacterBody2D

@export var speed : float = 150.0

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _physics_process(_delta: float) -> void:
	var input_dir := Input.get_vector("KeyBoard-A", "KeyBoard-D", "KeyBoard-W", "KeyBoard-S")
	velocity = input_dir * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("KeyBoard-Space"):
		print("Space is pressed")
		var enemies = get_tree().get_nodes_in_group('enemy') as Array[Enemy]
		var min_distance : float = INF
		var closest_enemy : Enemy
		for enemy in enemies:
			var distance = global_position.distance_squared_to(enemy.global_position)
			if distance < min_distance:
				min_distance = distance
				closest_enemy = enemy
		if closest_enemy:
			closest_enemy.take_damage(10.0)
