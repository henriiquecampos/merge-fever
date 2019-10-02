extends Control

onready var score_label = $HBoxContainer/ScoreLabel
onready var commit_label = $HBoxContainer/CommitLabel
onready var release_label = $HBoxContainer/ReleaseLabel

func _ready():
	PlayerData.connect("updated", self, "_on_PlayerData_updated")
	PlayerData.emit_signal("updated")


func _on_PlayerData_updated():
	score_label.text = "Score: %s" % PlayerData.score
	commit_label.text = "Code to merge: %s" % PlayerData.potential_score
	release_label.text = "Missed releases: %s" % PlayerData.missed_releases
