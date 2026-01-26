
# TODO

## Immediate Scratch pad
- Enemy Launcher needs to have a function to reset to a new wave
	- I'm thinking we put level settings in some kind of file which is polled every level
	- Godot supports JSON, so that's what we will do.
		- We'll have to specify some kind of format to represent how a level should play out and
		- What settings should be used for each level

# Bugs
- When the pause menu comes up, we need to hide WaveTransiter if it is visible, and unhide it once the pause menu goes away if it was
        - There is a bug where when you pause once the wave transition is enabled you can't select the first few options in PauseMenu
- When two enemy missiles collide they will explode even if one of them has not been detonated by a friendly missile yet
	- The intended behavior is that an enemy missile will only explode when colliding with either a friendly missile explosion or an enemy missile explosion
# Critical
- Defeating or surviving waves should lead into playing new waves
- Enemy missiles in the original game could split into multiple warheads partway through their flight.
	- This can be another knob to turn as we increase difficulty over time
- We need to introduce a new smart bomb type, which avoids friendly missiles on it's way to the target
- We need to introduce a bomber type, which is destructible itself, but also launches missiles as it travels horizontally through the screen.
- Save and track scores
	- Should the players score be saved when quitting early? I.e. by pressing the x on the window?

## Non-Critical

## Notes

