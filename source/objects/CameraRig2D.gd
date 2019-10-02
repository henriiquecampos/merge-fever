extends RemoteTransform2D

func _process(delta):
	position.x += GameStats.speed * delta
