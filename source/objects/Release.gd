extends Area2D

onready var visibility = $VisibilityNotifier2D
onready var inner = $Inner
onready var level = find_parent("Level")
onready var particles = $CPUParticles2D

var picked = false

func _ready():
	find_parent("BranchContainer").glow_master()


func _on_area_entered(area):
	PlayerData.score += PlayerData.potential_score
	PlayerData.potential_score = 0
	inner.color = area.get_node("Inner").color
	picked = true
	level.camera.shake_strength = Vector2(5, 5)
	particles.emitting = true
	level.camera.shake()
	GameStats.score_multiplier += 0.5
	find_parent("BranchContainer").stop_glow_master()


func _on_VisibilityNotifier2D_screen_exited():
	if not picked:
		PlayerData.missed_releases += 1
		PlayerData.potential_score = 0
		level.camera.shake_strength = Vector2(10, 10)
		level.camera.shake()
		level.damage_overlay.blink()
		$Damage.play()
	find_parent("BranchContainer").stop_glow_master()
	if $Damage.playing:
		yield($Damage, "finished")
		queue_free()
	else:
		queue_free()
