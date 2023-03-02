extends SpikesState

var DISTANCE_TO_IDLE = 5

func _ready() -> void:
	pass
	
func physics_update(_delta: float) -> void:
	if spikes.position.distance_to(spikes.original_position) <= DISTANCE_TO_IDLE:
		print("Transitioning to Idle...")
		state_machine.transition_to("Idle")
		return

	spikes.velocity = Vector2.ZERO
	spikes.velocity = spikes.position.direction_to(spikes.original_position) * spikes.speed
	spikes.velocity = spikes.move_and_slide(spikes.velocity)
	
func enter(_msg:= {}) -> void:
	print("Returning...")
	
func exit() -> void:
	pass
