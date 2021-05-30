class_name Player
extends Node2D

signal points_received(total_points)

export(float) var MOVEMENT_SPEED = 450.0

var points = 0

func _process(delta:float) -> void:
	self.position.x += MOVEMENT_SPEED * delta 

func _on_FlaskPickupArea_area_entered(area):
	if area.get_parent() is Flask:
		var flask = area.get_parent()
		self.points += 1
		emit_signal("points_received", self.points)
		flask.consume()
