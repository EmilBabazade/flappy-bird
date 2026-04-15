extends CanvasLayer
class_name menu

signal new_game


func _on_button_pressed() -> void:
	#get_tree().paused = false
	new_game.emit()
