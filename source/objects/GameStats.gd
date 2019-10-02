extends Node

export (float) var speed = 600.0
export (float) var max_speed = 2000.0
export (float) var score_multiplier = 1.0 setget set_score_multiplier
export (float) var max_score_multiplier = 5.0
export (float) var spawn_multiplier = 1.0
export (float) var max_spawn_multiplier

func _on_Timer_timeout():
	speed *= 1.1
	speed = min(speed, max_speed)
	spawn_multiplier += 0.5
	spawn_multiplier = min(spawn_multiplier, max_spawn_multiplier)
	$Timer.start(rand_range(10.0, 30.0))


func set_score_multiplier(new_value):
	score_multiplier = new_value
	score_multiplier = min(score_multiplier, max_score_multiplier)


func reset():
	speed = 600.0
	score_multiplier = 1.0
	spawn_multiplier = 1.0
