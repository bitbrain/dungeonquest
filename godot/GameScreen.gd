extends Node2D

onready var player = $GameObjects/Player
onready var points_control = $CanvasLayer/PointsControl

func _ready():
	player.connect("points_received", points_control, "set_points") 
