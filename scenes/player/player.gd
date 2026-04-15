extends CharacterBody2D
class_name Player

var gravity := 10.0
var jump := 400.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var jump_gap_sound: AudioStreamPlayer2D = $JumpGapSound
@onready var game_over_sound: AudioStreamPlayer2D = $GameOverSound

var is_dead := false

func _ready() -> void:
	ScoreManager.score_changed.connect(on_score_changed)
	HealthManager.game_over.connect(on_game_over)

func _physics_process(delta: float) -> void:
	# jump
	if Input.is_action_just_pressed("jump") and not is_dead:
		animation_player.play("jump")
		velocity.y = -jump
		if not jump_sound.playing:
			jump_sound.play()
	
	# gravity
	velocity.y += gravity
	
	move_and_slide()

func play_jump_gap_sound() -> void:
	if not jump_gap_sound.playing and not is_dead:
		jump_gap_sound.play()

func on_score_changed(s: int) -> void:
	if s % 10 == 0:
		gravity += gravity * 0.05

func on_game_over() -> void:
	if not is_dead:
		animation_player.play("die")
		is_dead = true
		game_over_sound.play()
