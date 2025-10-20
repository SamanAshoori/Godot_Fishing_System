extends Node2D

const Speed = 1.5;
@onready var sprite_2d: Sprite2D = $Sprite2D

var dir = -1
func _process(delta: float) -> void:
	if dir == -1:
		self.position.x = position.x - Speed
		sprite_2d.flip_h = false
	else:
		self.position.x = position.x + Speed
		sprite_2d.flip_h = true
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	dir *= -1
