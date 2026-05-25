extends Node

const room_1 = preload("res://scenes/rooms/room_1.tscn")
const room_2 = preload("res://scenes/rooms/room_2.tscn")
const room_3 = preload("res://scenes/rooms/room_3.tscn")
const room_4 = preload("res://scenes/rooms/room_4.tscn")
const room_5 = preload("res://scenes/rooms/room_5.tscn")
const room_6 = preload("res://scenes/rooms/room_6.tscn")
const room_7 = preload("res://scenes/rooms/room_7.tscn")
const room_8 = preload("res://scenes/rooms/room_8.tscn")
const room_9 = preload("res://scenes/rooms/room_9.tscn")

signal on_trigger_player_spawn

var spawn_door_tag

func go_to_room(room_tag, position_tag, entity_tag):
	var scene_to_load
	if entity_tag == "door":
		match room_tag:
			"room_1":
				scene_to_load = room_1
			"room_2":
				scene_to_load = room_2
			"room_3":
				scene_to_load = room_3
			"room_4":
				scene_to_load = room_4
			"room_5":
				scene_to_load = room_5
			"room_6":
				scene_to_load = room_6
			"room_7":
				scene_to_load = room_7
			"room_8":
				scene_to_load = room_8
			"room_9":
				scene_to_load = room_9
		if scene_to_load != null:
			spawn_door_tag = position_tag
			get_tree().call_deferred("change_scene_to_packed",scene_to_load)
			
func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position, direction)
