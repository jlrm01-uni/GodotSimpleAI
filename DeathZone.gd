extends Area2D


func _ready() -> void:
	pass


func _on_DeathZone_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_tree().call_group("Player", "die")
