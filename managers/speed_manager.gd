extends Node

var _speed := 250.0

func _ready() -> void:
	ScoreManager.score_changed.connect(on_score_changed)

func on_score_changed(s: int) -> void:
	if s % 10 == 0:
		_speed += _speed * 0.05
