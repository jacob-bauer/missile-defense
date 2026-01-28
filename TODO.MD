
# TODO

## Immediate Scratch pad
- Failure criteria:
	- All cities destroyed
		- Emit GameData.game_over 
- When all cities are destroyed
	- Disable the pause menu
	- Display the score
	- Give the user the option to save their score
	- Give the user the option to quit to menu
	- Give the user the option to restart
	- Give the user the option to quit to desktop

## Bugs

## Critical
- Implement some kind of global, configurable, logging methodology
	- This will end up requiring an addition to the main menu, "Settings"
	- In settings, we can have a page for setting up logging using a GUI
	- [This StackExchange post](https://softwareengineering.stackexchange.com/questions/112402/what-are-some-patterns-and-anti-patterns-of-application-logging) contains useful information on logging
		- We are going to need to define a default message layout
			- Perhaps
			```
				------------------
				<log_level>:<node-type>
				<datetime>
				<node-name>:<line-of-code-issuing>
				<payload>
			```
			- log_level
				- Status
					- Game starting
					- Wave changing
				- Informational
					- Missile launched at speed
				- Warning
					- Attempt to set Missile Speed higher than Max Missile Speed
				- Error
					- Tried to call an object that was already freed
					- [This forum link](https://forum.godotengine.org/t/how-to-get-stack-information-without-using-get-stack/96267/6) shows how to get a stacktrace during runtime
			- node-type
				- The name of the class that issues the log, i.e.: Missile, Silo, EnemyLauncher...
			- datetime
				- The date and time in UTC
			- node-name
				- The full path of the node, i.e.: Node.get_path()
			- line-of-code-issuing
				- The file name and line of code number for the issuing code.
				- This will require manual updating when code changes
			- payload
				- An instance specific payload.
				- For example, if I want to see the speed of Missiles when Launched the payload might look like:
					- "Speed:	55 pixels/second"
				- While the whole message might look like
				```
					INFORMATIONAL : Missile
					datetime
					Area2D@14 : missile.gd line 52
					Speed: 55 pixels/second"
				```
		- The logs should call an autoload logger, which will just use print statements (and possibly printerr in addition for Error log_level)
		- The logger will accept a log message type
		- The logger will be configurable so that the level of logging can be manually changed
			- But Error log_level should always be logged
			- The rest will be logged as flags, so you can set individual things
				- For example, I can log Status and Informational without caring about Warning
		- The logger will be configurable so that it will only log messages from a specific sender type(s)
- Playtesting shows that we need slower initial difficulty growth
	- So that we can start with i.e. 5 missiles, then grow by one each wave to 10, with no speed increase, and then by like 10% per wave over base each wave thereafter
- Playtesting shows that we need to limit the maximum speed of enemy missiles
	- I missed when exactly laurie said that speed became too great during her play test
	- I need to instrument enemy missile speed and hold another playtest
	- So enemy missile speed should grow by 10% each wave and I need to not when laurie complains
	- Then set the limit 10% higher than that
- Player should earn health at certain point thresholds
		- Instead, after a certain number of points, a destroyed city, if one exists will be selected at random and rebuilt.
- Failing a wave should lead into a game over mode
	- You should be able to save a high score
	- You should be able to restart
	- You should be able to quit to menu
	- You should be able to quit to desktop
- Enemy missiles in the original game could split into multiple warheads partway through their flight.
	- This can be another knob to turn as we increase difficulty over time
- We need to introduce a new smart bomb type, which avoids friendly missiles on it's way to the target
- We need to introduce a bomber type, which is destructible itself, but also launches missiles as it travels horizontally through the screen.
- Save and track scores
	- Should the players score be saved when quitting early? I.e. by pressing the x on the window?
		- No. It shouldn't.
		
## Non-Critical
- Every certain number of points, if a player has lost a city, a random city will reappear in it's position

## Notes

