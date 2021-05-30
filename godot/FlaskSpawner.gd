class_name FlaskSpawner
extends Node2D

export(NodePath) var SPAWN_TARGET_PATH

onready var FlaskScene = preload("res://flask/Flask.tscn")
onready var timer = $SpawnTimer

var spawn_target

func _ready():
	randomize()
	spawn_target = get_node(SPAWN_TARGET_PATH)
	_spawn()

func _on_SpawnTimer_timeout() -> void:
	_spawn()
	timer.start()

func _spawn() -> void:
	var flask = FlaskScene.instance()
	if randf() < 0.5:
		flask.type = Flask.FlaskType.POISON
	flask.global_position = global_position
	spawn_target.add_child(flask)
