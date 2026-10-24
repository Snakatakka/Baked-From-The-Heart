extends Node

func _parse(p_file_path : String) -> Variant:
	if FileAccess.file_exists(p_file_path):
		var file_data = FileAccess.open(p_file_path, FileAccess.READ)
		var parsed = JSON.parse_string(file_data.get_as_text())
		
		if parsed is Dictionary:
			return parsed
		else:
			push_error("%s is not a valid JSON file." % p_file_path)
			return
	push_error("File %s does not exist." % p_file_path)
	return
