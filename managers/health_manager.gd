extends Node

signal game_over

func die() -> void:
	game_over.emit()
