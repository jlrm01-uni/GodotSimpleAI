extends Node2D

export (String) var timeline

var already_triggered = false

func _ready() -> void:
	pass


func _on_Area2D_body_entered(body: Node) -> void:
	if timeline and not already_triggered:
		var dialog = Dialogic.start(timeline)
		add_child(dialog)
		already_triggered = true
