
# TODO

## Immediate Scratch pad
- Failure criteria:
	- All cities destroyed
- When all cities are destroyed
	- Pause the game
	- Display the score
	- Give the user the option to save their score
	- Give the user the option to quit to menu
	- Give the user the option to restart
	- Give the user the option to quit to desktop

## Bugs
- GameData.GameOver is getting triggered before all cities are destroyed
- When an enemy missile hits a city it explodes and blocks other enemy missiles from also hitting that city during it's explosion

## Critical
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

## Non-Critical

## Notes

