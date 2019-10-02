extends Area2D

onready var inner = $Inner
onready var level = find_parent("Level")
onready var particles = $CPUParticles2D
export (int) var score = 100

func _on_area_entered(area):
	PlayerData.potential_score += score * GameStats.score_multiplier
	inner.color = area.get_node("Inner").color
	level.camera.shake_strength = Vector2(5, 5)
	particles.emitting = true
	level.camera.shake()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
