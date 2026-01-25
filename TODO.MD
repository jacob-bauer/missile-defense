
# TODO

## Immediate Scratch pad
- Enemy Launcher needs to have a function to reset to a new wave
	- at the moment, it launches all it's missiles in the first wave, and never gets new ones
- When the pause menu comes up, we need to hide WaveTransiter if it is visible, and unhide it once the pause menu goes away if it was
	- There is a bug where when you pause once the wave transition is enabled you can't select the first few options in PauseMenu

# Critical
- BUG enemy missiles do not appear to blow up other enemy missiles
	- This bug was introduced whenever I changed EnemyLauncher.begin_attack form being called from PlayableArea on creation to being called by game
- When the game loads in, there should be a countdown to the game start, and thereon on new waves
	- New waves should have increasing difficulty, in enemy missile quantity, speed of launch, and missile speed
	- Introduce spawning of smart bombs
	- Introduce spawning of bombers
- Defeating or surviving waves should lead into playing new waves
- Enemy missiles in the original game could split into multiple warheads partway through their flight.
	- This can be another knob to turn as we increase difficulty over time
- We need to introduce a new smart bomb type, which avoids friendly missiles on it's way to the target
- We need to introduce a bomber type, which is destructible itself, but also launches missiles as it travels horizontally through the screen.
- Save and track scores
	- Should the players score be saved when quitting early? I.e. by pressing the x on the window?

## Non-Critical

## Notes

