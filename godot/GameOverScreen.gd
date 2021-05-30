extends Node2D

onready var points_label = $CanvasLayer/CenterContainer/VBoxContainer/PointsLabel

var exited = false

func _ready():
	points_label.text = str(Global.points) + " points"
	Global.reset_points()

func _input(event):
	if exited:
		return
	if event is InputEventKey and event.pressed:
		exited = true
		Global.goto_scene("res://GameScreen.tscn")
