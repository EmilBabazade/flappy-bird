extends Node2D
class_name Mover

@export var speed := 250.0
@export var to_move: Node2D


func _process(delta: float) -> void:
	to_move.global_position.x -= speed * delta
