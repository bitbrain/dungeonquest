extends Node2D

onready var player = $GameObjects/Player
onready var points_control = $CanvasLayer/PointsControl

func _ready():
	player.connect("flask_collected", self, "_flask_collected") 
	player.connect("game_over", self, "_on_game_over")
	Global.connect("points_updated", points_control, "set_points")
	
func _on_game_over():
	Global.goto_scene("res://GameOverScreen.tscn")
	
func _input(event):
	if event is InputEventKey and event.pressed:
		player.shapeshift()
		
func _flask_collected():
	Global.add_points(1)
