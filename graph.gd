extends Node

func _ready() -> void:
	var file: FileAccess = FileAccess.open(GameData.highscores_file_path,FileAccess.READ)
	
	if file == null:
		return
	
	var lines: Array[PackedStringArray] = []
	while not file.eof_reached():
		lines.append(file.get_csv_line(","))
	
	print(lines)
