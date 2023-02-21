extends Control


func _ready() -> void:
	pass

func reset_level():
	get_tree().call_group("Level", "reset_level")
