extends Area2D

class_name Door

@export var room_tag: String

@export var position_tag: String

@export var entity_tag: String

@onready var spawn = $Spawn

@onready var fade: CanvasLayer = $"../Fade"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		await fade.fade(1.0, 0.5).finished
		Globals.go_to_room(room_tag,position_tag,entity_tag)
		Globals.spawn_check(position_tag)
