extends Position2D

export (PackedScene) var spawnling

func spawn():
	var instance = spawnling.instance()
	instance.set_as_toplevel(true)
	instance.global_position = global_position
	add_child(instance)
