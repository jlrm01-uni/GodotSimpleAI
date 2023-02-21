extends SpikesState

var player = null

func _ready() -> void:
	pass
	
func physics_process(_delta: float) -> void:
	spikes.velocity = Vector2.ZERO
	
	if player:
		spikes.velocity = spikes.position.direction_to(player.position) * spikes.speed
		
	spikes.velocity = spikes.move_and_slide(spikes.velocity)

	for i in spikes.get_slide_count():
		var collision = spikes.get_slide_collision(i)
		
		if collision.collider.is_in_group("Player"):
			get_tree().call_group("Player", "die")
			
func enter(_msg:={}) -> void:
	print("Chasing...")
	player = _msg.who_to_chase
	
func _on_Area2D_body_exited(body: Node) -> void:
	if body.name == "Player":
		state_machine.transition_to("Return")
