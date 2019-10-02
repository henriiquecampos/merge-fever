extends Area2D

signal damaged

onready var visibility = $VisibilityNotifier2D
onready var inner = $Inner
onready var level = find_parent("Level")
onready var particles = $CPUParticles2D

export (int) var score = 30
export (int) var damage = 100

var picked = false


func _ready():
	find_parent("BranchContainer").glow_fix()


func _on_area_entered(area):
	PlayerData.potential_score += score * GameStats.score_multiplier
	inner.color = area.get_node("Inner").color
	picked = true
	level.camera.shake_strength = Vector2(5, 5)
	level.camera.shake()
	particles.emitting = true
	find_parent("BranchContainer").stop_glow_fix()


func _on_VisibilityNotifier2D_screen_exited():
	if not picked:
		PlayerData.score -= damage
		emit_signal("damaged")
		level.camera.shake_strength = Vector2(10, 10)
		level.camera.shake()
		level.damage_overlay.blink()
		$Damage.play()
	find_parent("BranchContainer").stop_glow_fix()
	if $Damage.playing:
		yield($Damage, "finished")
		queue_free()
	else:
		queue_free()
