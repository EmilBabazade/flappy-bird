extends Node2D

@onready var menu: CanvasLayer = $UI/Menu

func _ready() -> void:
	HealthManager.game_over.connect(on_game_over)

func on_game_over() -> void:
	menu.visible = true
	#get_tree().paused = true


func _on_menu_new_game() -> void:
	ScoreManager._score = 0
	get_tree().reload_current_scene()
