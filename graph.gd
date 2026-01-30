extends Node

func _ready() -> void:
	var file: FileAccess = FileAccess.open(GameData.highscores_file_path,FileAccess.READ)
	
	if file == null:
		return
	
	var lines: Array[PackedStringArray] = []
	while not file.eof_reached():
		lines.append(file.get_csv_line(","))
	
	var max_score: int = 0
	for line in lines:
		if (line.size() > 1) and (int(line[2]) > max_score):
			max_score = int(line[2])
	
	print(max_score)
	for i in range(0, lines.size() - 1):
		var percent_complete: float = float(i) / lines.size()
		var percent_height: float = float(lines[i][2]) / max_score
		$Line2D.add_point(Vector2(get_viewport().size.x * percent_complete, get_viewport().size.y * percent_height))
