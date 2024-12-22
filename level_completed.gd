extends ColorRect

signal retry()
signal next_level()

@onready var retry_button = $CenterContainer/VBoxContainer/HBoxContainer/RetryButton
@onready var next_level_button = $"CenterContainer/VBoxContainer/HBoxContainer/Next Level"


func _on_retry_button_pressed():
	retry.emit()


func _on_next_level_pressed():
	next_level.emit()
