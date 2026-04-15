extends Area2D
class_name Pipe

func upside_down() -> void:
	rotation_degrees = 180


func _on_body_entered(body: Node2D) -> void:
	HealthManager.die()


func _on_delete_timer_timeout() -> void:
	queue_free.call_deferred()
