
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
- Whenever a cityblock is permanently destroyed, it can still be targeted by EnemyLauncher in future waves
	- Ideally that position would no longer be targeted
	- Additionally, we need a way to add and remove targets anyway, to enable "bonus cities" (see non-critical about city regeneration)
	- One possible way to fix this is to convert GameData.target_positions to a dictionary {<node>:<target_data>}
		- <target_data> is some structure with the following fields:
			- Target Global Position: Vector2
			- Target Enabled: bool
		- When assembling this the first time, just put all the target global positions in and enable them
		- When a cityblock dies, you can simply find it by reference and set it's Enabled to false, us the "is_same(a, b)" function to compare by reference
		- When enemy launcher reads this, it simply gets all the values from the dict, and selects a random one
			- If that one is enabled, it launches to it and then deducts its launch count
			- Otherwise, it removes it from it's copy of the dict and selects a new random one

## Critical
- Whenever a city is permanently destroyed, it is still able to be targeted by EnemyLauncher in future waves. Fix this
- Playtesting shows that we need slower initial difficulty growth
	- So that we can start with i.e. 5 missiles, then grow by one each wave to 10, with no speed increase, and then by like 10% per wave over base each wave thereafter
- Playtesting shows that we need to limit the maximum speed of enemy missiles
	- Speed became to quick around wave 7
		- This should be speed roughly 43 pixels per second
		- Maybe round it out to 50 pxiels per second
- Cities should not rebuild between waves
	- Currently, cities are rebuilt between each wave. This makes the game almost unlosable
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

