extends Line2D

signal checked_out(message)

onready var head = $Head
export (Vector2) var offset = Vector2(80, 80)

var current_branch = 1

func _process(delta):
	points[points.size() -1].x += GameStats.speed * delta
	head.position = points[points.size() -1]


func _unhandled_input(event):
	if event.is_echo():
		return
	if not event.is_pressed():
		return
	if event.is_action("down"):
		merge_down()
	elif event.is_action("up"):
		merge_up()


func merge_up():
	if not current_branch < 2:
		return
	current_branch += 1
	current_branch = clamp(current_branch, 0, 2)
	var point_position = points[points.size() -1]
	point_position.y -= offset.y
	point_position.x += offset.x
	add_point(point_position)
	add_point(point_position)
	sync_head()
	if current_branch == 2:
		head.enable_fix()
	check_out()


func merge_down():
	if not current_branch > 0:
		return
	head.timer.start()
	current_branch -= 1
	current_branch = clamp(current_branch, 0, 2)
	var point_position = points[points.size() -1]
	point_position.y += offset.y
	point_position.x += offset.x
	add_point(point_position)
	add_point(point_position)
	sync_head()
	check_out()


func sync_head():
	var last_index = points.size() - 1
	points[last_index].x -= offset.x


func check_out():
	var message = "git checkout"
	match current_branch:
		0:
			message = "git checkout master"
		1:
			message = "git checkout development"
		2:
			message = "git checkout bug-fix"
	emit_signal("checked_out", message)
	$Head/Checkout.play()
