extends Node2D

onready var prompt_label = $CanvasLayer/CenterContainer/VBoxContainer/PromptLabel

var time = 0
var exited = false

func _process(delta):
	time += delta * 7.0
	prompt_label.modulate.a = sin(time)

func _input(event):
	if exited:
		return
	if event is InputEventKey and event.pressed:
		exited = true
		Global.goto_scene("res://GameScreen.tscn")
