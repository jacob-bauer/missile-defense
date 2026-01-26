
# TODO

## Immediate Scratch pad
- The cityblocks need to reset their state everytime the game resets

## Bugs
- You can still shoot missiles while waiting for the countdown
- When two enemy missiles collide they will explode even if one of them has not been detonated by a friendly missile yet
	- The intended behavior is that an enemy missile will only explode when colliding with either a friendly missile explosion or an enemy missile explosion
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

