extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@onready var sprite: AnimatedSprite2D = $Sprite2D

func _physics_process(delta: float) -> void:

	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_axis("move_left", "move_right")
	input_vector.y = Input.get_axis("move_up", "move_down")
	
	if input_vector.length() > 0:
		velocity = input_vector.normalized() * SPEED
		
		# Animation logic based on the dominant direction of movement
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				sprite.play("player_right")
			else:
				sprite.play("player_left")
		else:
			if input_vector.y > 0:
				sprite.play("player_down")
			else:
				sprite.play("player_up")
	else:
		# Decelerate when no input is received
		velocity = Vector2(0,0)
			
	move_and_slide()
