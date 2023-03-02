extends SpikesState

func _ready() -> void:
#	yield(owner, "ready")
#	setup_path()
	pass
	
	
func physics_update(_delta: float) -> void:
	if spikes.start_position == null or spikes.end_position == null:
		return
		
	spikes.pathFollow2d.offset += spikes.speed * _delta
	
	spikes.position = spikes.pathFollow2d.position
	
func enter(_msg:={}):
	print("Entering Patrol state...")
	
	setup_path()
	
	
func exit() -> void:
	pass
	
func setup_path():
	if spikes.start_position == null or spikes.end_position == null:
		print("You forgot the start or end position!")
		return

	if spikes.path2d.curve.get_point_count() != 0:
		spikes.pathFollow2d.offset = 0
		return
				
	print("Calculating curve...")
	
	var start = spikes.start_position.get_name(1)
	var end = spikes.end_position.get_name(1)
	
	var start_node = get_tree().root.find_node(start, true, false)
	var end_node = get_tree().root.find_node(end, true, false)
	
	var points = [start_node.position, 
				  end_node.position, 
				  start_node.position]
				
	for point in points:
		spikes.path2d.curve.add_point(point)
		
	var offset = spikes.path2d.curve.get_closest_offset(spikes.position)
	
	spikes.pathFollow2d.offset = offset
	
		

