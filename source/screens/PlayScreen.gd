extends Control

func _ready():
	BGM.play()
	PlayerData.connect("lose", self, "_on_Player_lose")
	var player_head = $Level/BranchContainer/Player/Head
	player_head.connect("area_entered", $InterfaceLayer/Interface/GitHistory,
			"_on_player_head_area_entered")
	var player = $Level/BranchContainer/Player
	player.connect("checked_out", $InterfaceLayer/Interface/GitHistory,
			"_on_player_checked_out")


func _on_RetryButton_button_up():
	PlayerData.reset()
	GameStats.reset()
	$AnimationPlayer.play_backwards("fade")
	yield($AnimationPlayer, "animation_finished")
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_Player_lose():
	get_tree().paused = true
	$InterfaceLayer/Interface/EndMenu.show()
