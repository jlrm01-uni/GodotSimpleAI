extends PlayerState

func enter(_msg := {}) -> void:
	player.current_state_label.text = name
	
func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		return
		
	player.velocity.x = 0
	
	if Input.is_action_pressed("walk_left"):
		player.velocity.x = player.velocity.x - player.speed
		player.sprite.flip_h = false
		
	if Input.is_action_pressed("walk_right"):
		player.velocity.x = player.velocity.x + player.speed
		player.sprite.flip_h = true
		
	# apply gravity
	player.velocity.y = player.velocity.y + player.GRAVITY * delta

	# move and slide
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Air", {do_jump = true})
	elif is_equal_approx(player.velocity.x, 0.0):
		state_machine.transition_to("Idle")
