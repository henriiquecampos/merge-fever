extends Area2D

onready var timer = $Timer
export (PackedScene) var pop_label_scene = preload("res://interfaces/pop_label/PopLabel.tscn")

func _on_area_entered(area):
	if area.is_in_group("bug"):
		disable_fix()
		spawn_pop_label("+ %s" % (area.score * GameStats.score_multiplier))
	elif area.is_in_group("feature"):
		spawn_pop_label("+ %s" % (area.score * GameStats.score_multiplier))
	elif area.is_in_group("release"):
		spawn_pop_label("RELEASED!!", Vector2(1.5, 1.5))
	$Score.play()


func spawn_pop_label(text, final_scale = Vector2(1, 1)):
	var pop_label = pop_label_scene.instance()
	pop_label.text = text
	pop_label.final_scale = final_scale
	pop_label.rect_global_position = global_position
	var container = find_parent("Level").get_node("PopLabelContainer")
	container.add_child(pop_label)


func enable_fix():
	set_collision_mask_bit(1, true)
	find_parent("BranchContainer").glow_development()


func disable_fix():
	set_collision_mask_bit(1, false)
	find_parent("BranchContainer").stop_glow_development()

