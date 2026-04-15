extends Area2D
class_name Pipe

func upside_down() -> void:
	rotation_degrees = 180


func _on_body_entered(body: Node2D) -> void:
	print("player entered")
