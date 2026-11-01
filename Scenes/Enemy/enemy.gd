extends CharacterBody2D

var speed : float = 100
var player : CharacterBody2D = null

func _ready() -> void:
	position.x = randi_range(-300, 300)
	position.y = randi_range(-200, 200)

func _process(delta: float) -> void:
	if player == null:
		return
	var dir := global_position.direction_to(player.global_position)
	velocity = dir * speed
	move_and_slide() 
