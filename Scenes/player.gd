extends CharacterBody2D

var Score = 0
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@onready var sprite: AnimatedSprite2D = $Sprite2D
@export var segments = 32

func _ready():
	var collion_shape = $fish_catching_area/CollisionShape2D
	var line_2d = $fish_catching_area/VisibleCollision
	var radius = collion_shape.shape.radius
	draw_circle_(line_2d,radius,segments)
	
	line_2d.width = 1.0
	line_2d.default_color = Color.GREEN
	
	
func draw_circle_(line_2d_node : Line2D , radius:float , segments: int):
	var points = PackedVector2Array()
	var angle_step = TAU / segments
	
	for i in range(segments + 1):
		var angle = angle_step * i
		var x = radius * cos(angle)
		var y = radius * sin(angle)
		
		points.append(Vector2(x,y))
	line_2d_node.points = points

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
