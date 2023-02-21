class_name Player
extends KinematicBody2D

export (int) var speed = 200 # pixels / second
export (int) var GRAVITY = 800 # pixels / second / second
export (int) var jump_force = 1800

onready var sprite = $Sprite
onready var idle_timer = $IdleTimer
onready var label: Label = $Label
onready var current_state_label: Label = $CurrentStateLabel

var velocity: Vector2 = Vector2()

var is_dying = false
export (bool) var is_disabled = false

var jump_particle_scene = load("res://jump_particles.tscn")
onready var jump_sound = load("res://sounds/jump_08.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false
	add_to_group("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _physics_process(delta: float) -> void:
#	velocity.x = 0
#
#	if not is_disabled:
#		if Input.is_action_pressed("walk_left"):
#			velocity.x = velocity.x - speed
#			sprite.flip_h = false
#			set_idle(false)
#
#
#		if Input.is_action_pressed("walk_right"):
#			velocity.x = velocity.x + speed
#			sprite.flip_h = true
#			set_idle(false)
#
#		if Input.is_action_just_pressed("jump"):
#			if is_on_floor():
#				velocity.y = -jump_force
#				set_idle(false)
#				show_jumping_particles()
#				SoundManager.play_sound(jump_sound)
#
#	velocity.y = velocity.y + GRAVITY * delta
#
#	velocity = move_and_slide(velocity, Vector2.UP)
#
#	if velocity.y != 0 and not is_on_floor():
#		idle_timer.start()
	pass

func _on_IdleTimer_timeout():
	set_idle(true)

func set_idle(value):
	if not is_disabled:
		if value:
			$Label.visible = true
		else:
			if is_on_floor():
				idle_timer.start()
				$Label.visible = false

func jump(boost=1):
	velocity.y = - jump_force * boost
	SoundManager.play_sound(jump_sound)

func die():
	if is_dying:
		return
	else:
		is_dying = true
		is_disabled = true
		
	get_tree().call_group("Level", "show_death_animation")
	
func show_jumping_particles():
	var instance = jump_particle_scene.instance()
	
	instance.position = self.global_position
	instance.emitting = true
	
	get_tree().root.add_child(instance)
	
	
