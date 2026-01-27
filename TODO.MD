
# TODO

## Immediate Scratch pad
- We're going to do a bit of logging first
	- Think about how to log object initialization and beginning conditions
	- Think about how to log the end of the game
- Failure criteria:
	- All cities destroyed
- When all cities are destroyed
	- Disable the pause menu
	- Display the score
	- Give the user the option to save their score
	- Give the user the option to quit to menu
	- Give the user the option to restart
	- Give the user the option to quit to desktop

## Bugs

## Critical
- Cities should not rebuild between waves
	- Instead, after a certain number of points, a destroyed city, if one exists will be selected at random and rebuilt.
- Failing a wave should lead into a game over mode
	- You should be able to save a high score
	- You should be able to restart
	- You should be able to quit to menu
	- You should be able to quit to desktop
- The enemy should make it a point to make sure that each city is targeted by at least 3 missiles before targeting any city with more missiles.
	- You can get VERY FAR into the game without actually doing anything without this.
- Enemy missiles in the original game could split into multiple warheads partway through their flight.
	- This can be another knob to turn as we increase difficulty over time
- We need to introduce a new smart bomb type, which avoids friendly missiles on it's way to the target
- We need to introduce a bomber type, which is destructible itself, but also launches missiles as it travels horizontally through the screen.
- Save and track scores
	- Should the players score be saved when quitting early? I.e. by pressing the x on the window?
		- No. It shouldn't.
## Non-Critical

## Notes

