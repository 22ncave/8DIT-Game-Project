extends Node2D

var mon_spawn = true

@onready var fade: CanvasLayer = $Doors/Fade

func _physics_process(delta: float) -> void:
	
	if Globals.monster_working == true:
		$monster.visible = true
		$monster.process_mode = Node.PROCESS_MODE_INHERIT
		if mon_spawn == true:
			$monster.global_position = Vector2(Globals.door_x,Globals.door_y)
			mon_spawn = false
	else:
		$monster.visible = false
		$monster.process_mode = Node.PROCESS_MODE_DISABLED
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$monster.visible = false
	$monster.process_mode = Node.PROCESS_MODE_DISABLED
	if Globals.spawn_door_tag != null:
		_on_level_spawn(Globals.spawn_door_tag)
		
func _on_level_spawn(position_tag: String):
	var door_path = "Doors/Door_" + position_tag
	var door = get_node(door_path) as Door
	Globals.trigger_player_spawn(door.spawn.global_position, door.position_tag)
	fade.fade(1.0, 0.0)
	await fade.fade(0.0, 0.5).finished
