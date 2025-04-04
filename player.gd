extends CharacterBody2D
@export var base_speed = 450.0
@export var gravity = 1500.0
@export var jump_vel = -500.0

func move_player(delta: float):
	var input_direction = Input.get_vector("move_left", "move_right", "move_down", "move_up")
	velocity.x = input_direction.x * base_speed
	velocity.y += gravity * delta
	 
func _physics_process(delta: float) -> void:
	move_player(delta)
	move_and_slide()
