
# TODO

## Immediate Scratch pad
- Scoring is actually quite hard without introducing all kinds of coupling all over the place
	- Therefore, we will need to architect a proper solution.
	- Essentially, I need to know:
		- When the enemy wave has been launched
		- When the enemy wave has been destroyed
		- How many missiles were in the enemy wave
		- How many enemy missiles were destroyed by the player
			- Easily calculated by summing when _on_missile_hit is run
		- How much ammunition the player has remaining when the round is over
		- How many times a silo was hit
			- Easily calculated by summing when _on_missile_hit is run
		- How many times a city was hit
			- Easily calculated by summing when _on_mmissile_hit is run
	- Perhaps signals are the solution
		- When the enemy wave has been launched, it can emit a signal, which also carries how many missiles were launched
		- GameData.gd can just have a field for player ammunition which silo adds to when it comes into existence, and removes from when it loses missiles
		- When the enemy wave has been destroyed can be calculated by having the enemy launcher emit a signal based on the number of it's children.
			- EnemyLauncher has two fixed children. When it launches its first missile, it can start polling for having no children. When it has no children AND no remaining ammo, it can emit a signal saying all missiles have been destroyed
	- Now, the end of the round is when EnemyLauncher causes GameData to emit it's wave_over signal
		- At this point, we can calculate the final score and move on to the next wave
	- New signals
		- GameData.wave_launched(missile_quantity: int)
		- GameData.wave_over()
# Critical
- Thoroughly define how rounds and games are scored.
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
- Add a counter for remaining enemy missiles to the hud
- Play with resolutions and scaling a bit
	- Changing scaling mode from integer to fractional seems to fix the problem I was having

## Notes

