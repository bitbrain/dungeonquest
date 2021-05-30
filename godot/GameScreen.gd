extends Node2D

onready var player = $GameObjects/Player
onready var points_control = $CanvasLayer/PointsControl
onready var objects_container = $GameObjects
onready var collect_scene = preload("res://effects/FlaskCollectEffect.tscn")

func _ready():
	player.connect("flask_collected", self, "_flask_collected") 
	player.connect("game_over", self, "_on_game_over")
	Global.connect("points_updated", points_control, "set_points")
	Global.connect("points_updated", player, "set_points")
	
func _on_game_over():
	Global.goto_scene("res://GameOverScreen.tscn")
	
func _input(event):
	if event is InputEventKey and event.pressed:
		player.shapeshift()
		
func _flask_collected(flask):
	var collect_effect = collect_scene.instance()
	collect_effect.type = flask.type
	collect_effect.global_position = flask.global_position
	objects_container.add_child(collect_effect)
	Global.add_points(1)
