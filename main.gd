extends Control

export (PackedScene) var next_scene = null
export (String, FILE, "*.tscn") var path_to_scene

func _on_PlayButton_pressed():
	get_tree().change_scene("res://levels/level1.tscn")


func _on_Timer_timeout() -> void:
	TransitionManager.transition_to(path_to_scene)
	
