extends Node2D

onready var coin_bag_label = $"%CoinBagLabel"
onready var canvas_layer: CanvasLayer = $CanvasLayer
export (int) var kill_depth = 240
onready var player: KinematicBody2D = $Player
export (AudioStreamSample) onready var music

func _ready():
	canvas_layer.visible = true
	add_to_group("Level")
	
	if music != null:
		SoundManager.play_music(music)
	else:
		print("Bro, you forgot to set the music!")
		
	
func _process(delta: float) -> void:
	coin_bag_label.text = str(Global.player_coins)
	check_for_kill_depth()
	
func check_for_kill_depth():
	if kill_depth == -1:
		return
		
	if player.position.y >= kill_depth:
		player.die()

func show_death_animation():
	var death_screen = load("res://DeathScreen.tscn")
	
	var death_screen_instance = death_screen.instance()
	canvas_layer.add_child(death_screen_instance)
	
func reset_level():
	get_tree().reload_current_scene()
