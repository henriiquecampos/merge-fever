extends Node

signal updated
signal lose

const MAX_MISSED_RELEASES = 3
var potential_score = 0 setget set_potential_score
var score = 0 setget set_score
var missed_releases = 0 setget set_missed_releases

func set_potential_score(new_value):
	potential_score = new_value
	potential_score = max(0, potential_score)
	emit_signal("updated")


func set_score(new_value):
	score = new_value
	score = max(0, score)
	emit_signal("updated")


func set_missed_releases(new_value):
	missed_releases = new_value
	missed_releases = max(0, missed_releases)
	check_missed_releases()
	emit_signal("updated")


func check_missed_releases():
	if missed_releases >= MAX_MISSED_RELEASES:
		emit_signal("lose")


func reset():
	missed_releases = 0
	potential_score = 0
	score = 0
	emit_signal("updated")
