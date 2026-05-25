extends Area2D

class_name Door

@export var room_tag: String

@export var position_tag: String

@export var entity_tag: String

@onready var spawn = $Spawn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.go_to_room(room_tag,position_tag,entity_tag)
