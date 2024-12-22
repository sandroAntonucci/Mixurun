extends Node

@onready var audio_stream_player = $AudioPlayers/AudioStreamPlayer
@onready var audio_stream_player_2 = $AudioPlayers/AudioStreamPlayer2
@onready var audio_stream_player_3 = $AudioPlayers/AudioStreamPlayer3
@onready var audio_stream_player_4 = $AudioPlayers/AudioStreamPlayer4

func play_pick():
	audio_stream_player.play()

func play_jump():
	audio_stream_player_2.play()
	
func play_hurt():
	audio_stream_player_3.play()

func play_win():
	audio_stream_player_4.play()
