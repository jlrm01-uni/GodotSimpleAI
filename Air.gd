extends PlayerState

func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		player.velocity.y = -player.jump_force
		
	player.current_state_label.text = name
	
func physics_update(delta: float) -> void:
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

	# landing
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")
