extends CanvasLayer

@onready var score_label: Label = $Label

func _ready() -> void:
	score_label.text = str(ScoreManager._score)
	ScoreManager.score_changed.connect(on_score_changed)

func on_score_changed(s: int) -> void:
	score_label.text = str(ScoreManager._score)
