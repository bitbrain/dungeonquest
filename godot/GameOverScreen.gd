extends Node2D

onready var points_label = $CanvasLayer/CenterContainer/VBoxContainer/PointsLabel

func _ready():
	points_label.text = str(Global.points) + " points"
