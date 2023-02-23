class_name Spikes
extends KinematicBody2D

onready var patrol_timer: Timer = $PatrolTimer

var speed = 25
var velocity = Vector2.ZERO

var player = null
var original_position = null

onready var path2d: Path2D = $Path2D
onready var pathFollow2d: PathFollow2D = $Path2D/PathFollow2D

export (NodePath) var start_position = null
export (NodePath) var end_position = null

func _ready() -> void:
	add_to_group("Enemies")
	original_position = position

func _on_Spikey_body_entered(body: Node) -> void:
	if body.name == "Player":
		get_tree().call_group("Player", "die")
