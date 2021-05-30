extends CenterContainer

var exited = false

func _unhandled_input(event):
	if !exited:
		Global.goto_scene("res://GameScreen.tscn")
		exited = true
