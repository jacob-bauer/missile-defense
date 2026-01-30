extends Node2D

func _ready() -> void:
	var file: FileAccess = FileAccess.open(GameData.highscores_file_path,FileAccess.READ)
	
	if file == null:
		return
	
	var lines: Array[PackedStringArray] = []
	while not file.eof_reached():
		lines.append(file.get_csv_line(","))
	lines.remove_at(-1)
	
	var max_score: int = 0
	for line in lines:
		var current_score:int = int(line[2])
		if current_score > max_score:
			max_score = current_score
	
	var viewport_width: int = ProjectSettings.get_setting("display/window/size/viewport_width")
	var viewport_height: int = ProjectSettings.get_setting("display/window/size/viewport_height")
	for i in range(0, lines.size()):
		var percent_complete: float = float(i) / lines.size()
		var percent_height: float = 1 - float(lines[i][2]) / max_score
		$CanvasLayer/Line2D.add_point(Vector2(viewport_width * percent_complete, viewport_height * percent_height))
