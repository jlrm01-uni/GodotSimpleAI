class_name SpikesState
extends State

var spikes: Spikes

func _ready() -> void:
	yield(owner, "ready")
	
	spikes = owner as Spikes
	
	assert(spikes != null)
