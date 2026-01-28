extends Node
class_name GameLogger


enum LOG_LEVEL {
	NONE = 0,
	ERROR = 2,
	WARNING = 4,
	STATUS = 8,
	INFORMATIONAL = 16,
}

## Each bit represents a LOG_LEVEL.
var log_level_flags: int = LOG_LEVEL.NONE
## An array of strings which represent class_names of types to match against
var requester_types: Array[String] = []


func record_log_entry(message: LogMessage) -> void:
	if not message.log_level & log_level_flags:
		return
	elif not message.sender_name in requester_types:
		return
	else:
		if (log_level_flags & LOG_LEVEL.ERROR) and (message.log_level == LOG_LEVEL.ERROR):
			printerr(message.log_message)
	
		print(message.log_message)
