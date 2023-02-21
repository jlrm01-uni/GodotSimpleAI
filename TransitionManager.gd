extends CanvasLayer

onready var color_rect: ColorRect = $ColorRect


func _ready() -> void:
	color_rect.visible = false
	
func transition_to(packed_scene: String, 
					fade_in_time: float = .5, 
					fade_out_time: float = .5):
	var tween = get_tree().create_tween()
	
	color_rect.modulate = Color(0, 0, 0, 0)
	color_rect.visible = true
	
	tween.connect("finished", self, "on_tween_finished")
	
	tween.tween_property(color_rect, "modulate", Color.black, fade_in_time)
	tween.tween_callback(get_tree(), "change_scene", [packed_scene])

	tween.tween_property(color_rect, "modulate", Color(0, 0, 0, 0), fade_out_time)

func on_tween_finished():
	print("finished the transition!")
