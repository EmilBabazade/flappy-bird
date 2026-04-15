extends CharacterBody2D
class_name Player

var gravity := 10.0
var jump := 400.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var jump_gap_sound: AudioStreamPlayer2D = $JumpGapSound

func _physics_process(delta: float) -> void:
	# jump
	if Input.is_action_just_pressed("jump"):
		animation_player.play("jump")
		velocity.y = -jump
		if not jump_sound.playing:
			jump_sound.play()
	
	# gravity
	velocity.y += gravity
	
	move_and_slide()

func play_jump_gap_sound() -> void:
	if not jump_gap_sound.playing:
		jump_gap_sound.play()
