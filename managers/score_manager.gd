extends Node

signal score_changed(s: int)
var _score: int = 0

func increase() -> void:
	_score += 1
	score_changed.emit(_score)
