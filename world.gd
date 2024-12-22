extends Node2D

@export var next_level: PackedScene

var level_time = 0.0

@onready var level_completed = $CanvasLayer/LevelCompleted
@onready var start_in_label = %StartInLabel
@onready var start_in = %StartIn
@onready var animation_player = $AnimationPlayer
@onready var level_time_label = %LevelTimeLabel
@onready var end_level = $EndLevel
@onready var level_time_label_2 = %LevelTimeLabel2

func _ready():
	if not next_level is PackedScene:
		level_completed.next_level_button.text = "Victory Screen"
		next_level = load("res://victory_screen.tscn")
		
	level_time_label.show()
	level_time_label_2.hide()
	Events.level_completed.connect(show_level_completed)
	get_tree().paused = true
	LevelTransition.fade_from_black()
	animation_player.play("countdown")
	await animation_player.animation_finished
	get_tree().paused = false
	
func _process(delta):
	
	level_time = round_to_dec(end_level.time_left, 2)
	
	level_time_label.text = str(level_time)
	level_time_label_2.text = str(level_time)
	
	if level_time <= 3.0:
		level_time_label.hide()
		level_time_label_2.show()

	
	if level_time <= 0.0:
		retry()
	
	if Input.is_action_just_pressed("ui_cancel"):
		retry()
		
	if Input.is_action_just_pressed("level_nine"):
		next_level = load("res://level_seven.tscn")
		get_tree().change_scene_to_packed(next_level)
	
func retry():
	await LevelTransition.fade_to_black()
	get_tree().paused = false
	get_tree().change_scene_to_file(scene_file_path)
	
func retry_2():
	get_tree().paused = false
	get_tree().change_scene_to_file(scene_file_path)

func go_to_next_level():
	if not next_level is PackedScene: return
	await LevelTransition.fade_to_black()
	get_tree().paused = false 
	get_tree().change_scene_to_packed(next_level)
	

func show_level_completed():
	SoundPlayer.play_win()
	level_completed.show()
	level_completed.retry_button.grab_focus()
	get_tree().paused = true
	
	
func _on_level_completed_next_level():
	go_to_next_level()


func _on_level_completed_retry():
	retry()


func _on_end_level_timeout():
	retry_2()

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
