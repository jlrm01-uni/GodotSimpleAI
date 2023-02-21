extends Area2D

export (int) var boost_multiplier = 1
export (bool) var enabled = true

var current_body = null

func _ready() -> void:
	pass


func _on_JumpPad_body_entered(body: Node) -> void:
	current_body = body
	make_jump()

func make_jump():
	if not enabled:
		return
		
	if not current_body:
		return
		
	if current_body.name == "Player":
		current_body.jump(boost_multiplier)
		$AnimationPlayer.play("jump_pad_animation")
	
