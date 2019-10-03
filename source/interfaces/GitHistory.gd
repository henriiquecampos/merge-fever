extends VBoxContainer

export (PackedScene) var git_command = preload("res://interfaces/GitCommand.tscn")

func add_git_command(text):
	if get_child_count() > 4:
		for child in get_children():
			if not child.is_queued_for_deletion():
				child.queue_free()
				break
	var instance = git_command.instance()
	instance.text = text
	add_child(instance)


func _on_player_head_area_entered(area):
	if area.is_in_group("bug"):
		PlayerData.commit_counters['fix'] += 1
		add_git_command("git merge bug-fix")
	elif area.is_in_group("feature"):
		PlayerData.commit_counters['feature'] += 1
		add_git_command('git commit -m "new feature!"')
	elif area.is_in_group("release"):
		add_git_command("git merge development")
		PlayerData.bump_version()
		var v = PlayerData.current_version
		add_git_command('git tag "v%d.%d.%d"' % v)


func _on_player_checked_out(message):
	add_git_command(message)
