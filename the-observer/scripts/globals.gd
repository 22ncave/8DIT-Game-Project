extends Node

var player_room
var time_passed: float = 0.0
var num 
var monster_room
var monster_working
var monster_agro = 0
var door_x 
var door_y 

func spawn_check(tag):
	if tag == "n":
		door_x = 576
		door_y = 0
	elif tag == "s":
		door_x = 576
		door_y = 648
	elif tag == "w":
		door_x = 50
		door_y = 332
	elif tag == "e":
		door_x = 1100
		door_y = 332

func monster_anger():
	monster_agro = 3

func agro_check():
	if monster_agro > 0:
		monster_agro -= 1

func _physics_process(delta: float) -> void:
	time_passed += delta
	if time_passed >= 1.0:
		num = randi_range(1, 4)
		num *= (4 + monster_agro)
		if num >12:
			monster_room = randi_range(2,9)
			if monster_room == player_room:
				monster_working = true
		time_passed = 0.0

const room_1 = preload("res://scenes/rooms/room_1.tscn")
const room_2 = preload("res://scenes/rooms/room_2.tscn")
const room_3 = preload("res://scenes/rooms/room_3.tscn")
const room_4 = preload("res://scenes/rooms/room_4.tscn")
const room_5 = preload("res://scenes/rooms/room_5.tscn")
const room_6 = preload("res://scenes/rooms/room_6.tscn")
const room_7 = preload("res://scenes/rooms/room_7.tscn")
const room_8 = preload("res://scenes/rooms/room_8.tscn")
const room_9 = preload("res://scenes/rooms/room_9.tscn")
const death_cutscene = preload("res://scenes/cutscene.tscn")

signal on_trigger_player_spawn

var spawn_door_tag

func go_to_room(room_tag, position_tag, entity_tag):
	var scene_to_load
	if entity_tag == "door":
		match room_tag:
			"room_1":
				scene_to_load = room_1
				player_room = 1
				monster_working = false
				agro_check()
			"room_2":
				scene_to_load = room_2
				player_room = 2
				monster_working = false
				agro_check()
			"room_3":
				scene_to_load = room_3
				player_room = 3
				monster_working = false
				agro_check()
			"room_4":
				scene_to_load = room_4
				player_room = 4
				monster_working = false
				agro_check()
			"room_5":
				scene_to_load = room_5
				player_room = 5
				monster_working = false
				agro_check()
			"room_6":
				scene_to_load = room_6
				player_room = 6
				monster_working = false
				agro_check()
			"room_7":
				scene_to_load = room_7
				player_room = 7
				monster_working = false
				agro_check()
			"room_8":
				scene_to_load = room_8
				player_room = 8
				monster_working = false
				agro_check()
			"room_9":
				scene_to_load = room_9
				player_room = 9
				monster_working = false
				agro_check()
		if scene_to_load != null:
			spawn_door_tag = position_tag
			get_tree().call_deferred("change_scene_to_packed",scene_to_load)
			
func player_death():
	spawn_door_tag = null
	get_tree().call_deferred("change_scene_to_packed",death_cutscene)

func restart():
	spawn_door_tag = null
	get_tree().call_deferred("change_scene_to_packed",room_1)
	monster_working = false
	monster_agro = 0
	player_room = 1

func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position, direction)
