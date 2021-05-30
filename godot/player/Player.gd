class_name Player
extends Node2D

signal flask_collected
signal game_over

export(float) var MOVEMENT_SPEED = 650.0

var type = Flask.FlaskType.MANA
var game_over = false

func _ready():
	_assume_form()

func _process(delta:float) -> void:
	if game_over:
		return
	self.position.x += MOVEMENT_SPEED * delta 

func _on_FlaskPickupArea_area_entered(area):
	if area.get_parent() is Flask:
		var flask = area.get_parent()
		if self.type == flask.type:
			emit_signal("flask_collected")
		else:
			game_over = true
			emit_signal("game_over")	
		flask.consume()
		
func shapeshift():
	if type == Flask.FlaskType.MANA:
		type = Flask.FlaskType.POISON
	else:
		type = Flask.FlaskType.MANA
	_assume_form()
		
func _assume_form():
	if type == Flask.FlaskType.MANA:
		$ManaSprite.visible = true
		$PoisonSprite.visible = false
	else:
		$ManaSprite.visible = false
		$PoisonSprite.visible = true
