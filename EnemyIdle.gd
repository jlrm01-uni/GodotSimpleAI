extends SpikesState

func physics_update(_delta: float):
	pass
	
func enter(_msg:={}) -> void:
	spikes.original_position = spikes.position
	spikes.patrol_timer.start()

func _on_PatrolTimer_timeout() -> void:
	state_machine.transition_to("Patrol")

func _on_Area2D_body_entered(body: Node) -> void:
	if body.name == "Player":
		state_machine.transition_to("Chase", {who_to_chase=body})
