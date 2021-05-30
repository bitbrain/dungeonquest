extends Node2D

onready var player = $GameObjects/Player
onready var points_control = $CanvasLayer/PointsControl

func _ready():
	player.connect("points_received", points_control, "set_points") 
	player.connect("game_over", self, "_on_game_over")
	
func _on_game_over():
	Global.goto_scene("res://GameScreen.tscn")
