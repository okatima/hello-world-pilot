extends Area2D

@onready var level_label: Label = $LevelLabel
@export var level_to_load: PackedScene 

@onready var can_load_level : bool = false

@export var display_name: String = ""

func _ready() -> void:
	level_label.hide()
	level_label.text = display_name
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and can_load_level:
		get_tree().change_scene_to_packed(level_to_load)
	

func _on_body_entered(body: Node2D) -> void:
	level_label.show()
	can_load_level = true
	

func _on_body_exited(body: Node2D) -> void:
	level_label.hide()
	can_load_level = false
