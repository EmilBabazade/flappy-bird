extends CharacterBody2D
class_name Player

var gravity := 10.0
var jump := 400.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	# jump
	if Input.is_action_just_pressed("jump"):
		animation_player.play("jump")
		velocity.y = -jump
	
	# gravity
	velocity.y += gravity
	
	move_and_slide()
