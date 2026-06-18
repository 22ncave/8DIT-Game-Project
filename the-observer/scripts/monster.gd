extends CharacterBody2D

@onready var nav_agent = $NavigationAgent2D
var speed = 300
var sees_player = false


@export var entity_tag : String

@export var player:CharacterBody2D

func _physics_process(delta: float) -> void:
	
	if not player:
		return
	
	if sees_player == true:
		nav_agent.target_position = player.global_position
	
	var next_path_pos = nav_agent.get_next_path_position()
	
	var direction = (next_path_pos - global_position).normalized()
	
	velocity = direction * speed
	move_and_slide()



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Globals.player_death()


func _on_sight_line_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		sees_player = true
