extends Area2D
class_name Gap

@onready var cs: CollisionShape2D = $CollisionShape2D

func get_height() -> float:
	var shape: RectangleShape2D = cs.shape
	return shape.size.y
