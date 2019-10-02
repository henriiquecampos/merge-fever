extends Line2D

onready var head = $Head

func _process(delta):
	points[points.size() -1].x += GameStats.speed * delta
	head.position = points[points.size() -1]
