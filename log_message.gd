extends RefCounted
class_name LogMessage


var sender_name: String
var sender_path: String
var log_level: GameLogger.LOG_LEVEL
var issuing_line: int
var payload: String
var utc_datetime: String


var log_message: String:
	set(value):
		pass
	get:
		return \
		"""------------------------------
		{log_level}\t:\t{node_type}
		{datetime}
		{node_name}\t:\t{line_of_code}
		{payload}""".format({"log_level":GameLogger.LOG_LEVEL.keys()[log_level],
							 "node_type":sender_name,
							 "datetime":utc_datetime,
							 "node_name":sender_path,
							 "line_of_code":issuing_line,
							 "payload":payload})


func _init(sent_by: Node, level_flag: GameLogger.LOG_LEVEL, code_line: int, message: String) -> void:
	sender_name = sent_by.get_class()
	sender_path = sent_by.get_path()
	log_level = level_flag
	issuing_line = code_line
	payload = message
	utc_datetime = Time.get_datetime_string_from_system(true)
