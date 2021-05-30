extends Node2D

var type = Flask.FlaskType.MANA

func _ready():
	if type == Flask.FlaskType.MANA:
		$ManaEffect.visible = true
		$PoisonEffect.visible = false
	else:
		$ManaEffect.visible = false
		$PoisonEffect.visible = true


func _on_RemovalTimer_timeout():
	queue_free()
