extends Marker2D
class_name PipeSpawner

@onready var spawn_timer: Timer = $Timer
@export var pipe_scene: PackedScene
@export var gap_scene: PackedScene
@export var spawn_top: Marker2D
@export var spawn_bottom: Marker2D

func _ready() -> void:
	ScoreManager.score_changed.connect(on_score_changed)

func _on_timer_timeout() -> void:
#	spawn gap
	var gap := gap_scene.instantiate() as Gap
	add_child(gap)
	var h := gap.get_height() / 2
	var min_y := spawn_top.global_position.y + h
	var max_y := spawn_bottom.global_position.y - h
	gap.global_position.y = randf_range(min_y, max_y)
#	spawn top pipe
	var pipe1 := pipe_scene.instantiate() as Pipe
	pipe1.upside_down()
	add_child(pipe1)
	pipe1.global_position.y = gap.global_position.y - h
#	spawn bottom pipe
	var pipe2 := pipe_scene.instantiate() as Pipe
	add_child(pipe2)
	pipe2.global_position.y = gap.global_position.y + h

func on_score_changed(s: int) -> void:
	var wait_time := spawn_timer.wait_time
	if s % 10 == 0 and wait_time > 1.0:
		spawn_timer.wait_time -= wait_time * 0.1
