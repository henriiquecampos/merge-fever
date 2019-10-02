extends Label

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		queue_free()

func fade():
	$AnimationPlayer.play("fade_out")
