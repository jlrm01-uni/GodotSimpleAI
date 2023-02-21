extends Area2D

func _ready():
	pass # Replace with function body.



func _on_coin_body_entered(body) -> void:
	if body.name == "Player":
		Global.player_coins += 1
		queue_free()
		print(Global.player_coins)

