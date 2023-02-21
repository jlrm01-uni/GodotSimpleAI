extends Area2D

export (PackedScene) var scene_to_load = null
export (String, FILE, "*.tscn") var path_to_scene

func _ready() -> void:
	pass


func _on_GoalFlag_body_entered(body: Node) -> void:
	if body.name == "Player":
		if path_to_scene != null:
			TransitionManager.transition_to(path_to_scene)
			
