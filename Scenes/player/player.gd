extends CharacterBody2D

@export var speed : float = 150.0

#func _ready() -> void:
	#motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _physics_process(_delta: float) -> void:
	var input_dir := Input.get_vector("KeyBoard-A", "KeyBoard-D", "KeyBoard-W", "KeyBoard-S")
	velocity = input_dir * speed
	move_and_slide()
	
