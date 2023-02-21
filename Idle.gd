extends PlayerState

func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO
	player.idle_timer.start()
	player.current_state_label.text = name
	
func physics_update(_delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		return
		
	if Input.is_action_pressed("jump"):
		state_machine.transition_to("Air", {do_jump = true})
		hide_idle_label()
	elif Input.is_action_pressed("walk_left") or Input.is_action_pressed("walk_right"):
		state_machine.transition_to("Run")
		hide_idle_label()

func _on_IdleTimer_timeout() -> void:
	player.label.visible = true

func hide_idle_label():
	player.label.visible = false
	
