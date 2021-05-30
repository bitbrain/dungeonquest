class_name Flask
extends Node2D

enum FlaskType {
	MANA,
	POISON
}

export(FlaskType) var type = FlaskType.MANA

func _ready():
	if type == FlaskType.MANA:
		$ManaSprite.visible = true
		$PoisonSprite.visible = false
	else:
		$ManaSprite.visible = false
		$PoisonSprite.visible = true

func consume() -> void:
	queue_free()
