extends Control


func _ready() -> void:
	pass


func _on_RestartButton_pressed() -> void:
	get_tree().change_scene("res://levels/level1.tscn")


func _on_MainMenuButton_pressed() -> void:
	get_tree().change_scene("res://main.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()

