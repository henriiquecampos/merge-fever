extends "res://objects/Spawner.gd"

onready var timer = $Timer

export (float) var min_wait_time = 1.0
export (float) var max_wait_time = 5.0

func _ready():
	randomize()
	start_timer()
	timer.start()


func start_timer():
	timer.start(rand_range(min_wait_time, max_wait_time) * GameStats.spawn_multiplier) 


func spawn():
	.spawn()
	start_timer()
