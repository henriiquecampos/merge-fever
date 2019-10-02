extends Node2D

onready var player = $Player
onready var animator_fix = $Fix/AnimationPlayer
onready var animator_master = $Master/AnimationPlayer
onready var animator_dev = $Development/AnimationPlayer

func glow_fix():
	if not animator_fix.is_playing():
		animator_fix.play("glow")


func stop_glow_fix():
	animator_fix.stop()
	$Fix.default_color = Color("5653d1")


func glow_master():
	if not animator_fix.is_playing():
		animator_master.play("glow")


func stop_glow_master():
	animator_master.stop()
	$Master.default_color = Color("5653d1")


func glow_development():
	if not animator_dev.is_playing():
		stop_glow_fix()
		animator_dev.play("glow")


func stop_glow_development():
	animator_dev.stop()
	$Development.default_color = Color("5653d1")
