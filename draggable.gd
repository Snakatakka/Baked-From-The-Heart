@tool
extends Node2D

@export var size : Vector2 = Vector2(120, 120)
@export var sprite_texture : Texture2D = preload("res://icon.svg")
@onready var button : Button = $Button
@onready var sprite : Sprite2D = $Sprite2D
@onready var collision_shape : CollisionShape2D = $Area2D/CollisionShape2D
var original_position : Vector2
var held : bool = false

func _ready() -> void:
	original_position = global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_handle_color()
	_handle_vars()
	
	if not Engine.is_editor_hint():
		if held:
			position = get_global_mouse_position()
		else:
			if position != original_position:
				position = original_position

func _handle_vars() -> void:
		button.size = size
		collision_shape.shape.size = size
		sprite.texture = sprite_texture

func _handle_color() -> void:
		if Engine.is_editor_hint(): # Only makes the button transparent when the games running, for reasons.
			button.self_modulate = Color.hex(0x0000ff)
		else:
			button.self_modulate = Color.hex(0x000000)

func _on_button_pressed() -> void:
	held = !held
	print(name)
