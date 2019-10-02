extends VBoxContainer

export (PackedScene) var git_command = preload("res://interfaces/GitCommand.tscn")

func add_git_command(text):
	if get_child_count() > 4:
		var first = get_child(0)
		first.queue_free()
	var instance = git_command.instance()
	instance.text = text
	add_child(instance)


func _on_player_head_area_entered(area):
	if area.is_in_group("bug"):
		add_git_command("git merge bug-fix")
	elif area.is_in_group("feature"):
		add_git_command('git commit -m "new feature!"')
	elif area.is_in_group("release"):
		add_git_command("git merge development")


func _on_player_checked_out(message):
	add_git_command(message)
