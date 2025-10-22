extends Node2D

@export var possible_fish: Array[PackedScene] = []
var fish_count = 0

func _spawn_random_item() -> void:
	var random_distance := randf_range(-300, 300.0)
	var direction := Vector2(1,0)
	var fish_scene = possible_fish.pick_random()
	var fish: Node2D = fish_scene.instantiate()
	add_child(fish)
	fish.position.y += random_distance
	

func _process(delta: float) -> void:
	if fish_count < 2:
		_spawn_random_item()
		fish_count += 1
	else:
		pass
