extends Node2D

@export var possible_fish: Array[PackedScene] = []
var fish_count = 0

func _spawn_random_item() -> void:
	var fish_scene = possible_fish.pick_random()
	var fish: Node2D = fish_scene.instantiate()
	add_child(fish)
	

func _process(delta: float) -> void:
	if fish_count == 0:
		_spawn_random_item()
		fish_count += 1
	else:
		pass
