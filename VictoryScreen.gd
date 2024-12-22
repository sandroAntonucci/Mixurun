extends CenterContainer

@onready var button = %Button

func _ready():
	LevelTransition.fade_from_black()
	button.grab_focus()
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")
