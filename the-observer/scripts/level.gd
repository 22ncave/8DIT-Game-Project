extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Globals.spawn_door_tag != null:
		_on_level_spawn(Globals.spawn_door_tag)
		
func _on_level_spawn(position_tag: String):
	var door_path = "Doors/Door_" + position_tag
	var door = get_node(door_path) as Door
	Globals.trigger_player_spawn(door.spawn.global_position, door.position_tag)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
