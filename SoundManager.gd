extends Node2D

onready var audio_stream_player: AudioStreamPlayer = $Music/AudioStreamPlayer
onready var sounds: Node2D = $Sounds

func _ready() -> void:
	pass

func play_music(resource):
	audio_stream_player.stream = resource
	audio_stream_player.play()
	
func play_sound(resource, volume_db=-18.0):
	var new_sound_player = AudioStreamPlayer.new()
	
	new_sound_player.connect("finished", self, 
							 "on_sound_finished_playing", 
							 [new_sound_player])
	
	sounds.add_child(new_sound_player)
	new_sound_player.stream = resource
	new_sound_player.volume_db = volume_db
	new_sound_player.play()

func on_sound_finished_playing(player_instance):
	player_instance.queue_free()
	

func _on_AudioStreamPlayer_finished() -> void:
	audio_stream_player.play()
