extends Label

func _init():
	set_points(0)

func set_points(points) -> void:
	text = "Points: " + str(points)
