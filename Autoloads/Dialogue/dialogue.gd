extends Node

var Textbox : PackedScene = preload("res://Nodes/Textbox/textbox.tscn")
var test : String = "res://test.json"

## Takes a name for the dialogue, piece of dialogue, character name, scene root (which should always be self), read rate (optional) and whether or not the dialogue ends early (also optional, if you put a number here it will end early)
func _create_dialogue(p_file : String, p_internal_name : String, p_scene_root : Node, p_read_rate : float = 0.025, p_ends_early : float = 0.0) -> void:
	var new_textbox = Textbox.instantiate()
	var data = JSONParser._parse(p_file)
	
	new_textbox.name = p_internal_name
	new_textbox.dialogue = data["lines"][p_internal_name]["dialogue"]
	new_textbox.character_name = data["lines"][p_internal_name]["name"]
	new_textbox.character_read_rate = p_read_rate
	p_scene_root.add_child(new_textbox)
	
	if p_ends_early != 0.0:
		new_textbox.end_dialogue_manually = false
		await get_tree().create_timer(p_ends_early).timeout
		new_textbox._finish()
