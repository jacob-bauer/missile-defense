
# TODO

## Immediate Scratch pad
- Next thing is to build a city
	- This involves also abstracting the missile launching functionality from Silo into a separate Launcher type.
		- A "Silo" should be a specific subtype of launcher that does things like displaying the number of missiles it has and taking damage
		- Then, a bomber can be a subtype of a launcher which flies across the screen and takes damage itself
		- This will also invlove modifying "EnemyLauncher" scene so that it uses the new launcher type instead of the silo
		- This seems like a task for composition rather than inheritance.
			- A silo and a bomber and the enemy base all "have" launchers, instead of "are" launchers
## Critical
- Implement a pause menu
	- Allow to quit
	- Allow to restart game
	- Allow to return to main menu
	- Will show us how to pause game, but still show and interact with some UI elements during pause
- When the game loads in, there should be a countdown to the game start, and thereon on new waves
	- New waves should have increasing difficulty, in enemy missile quantity, speed of launch, and missile speed
	- Introduce spawning of smart bombs
	- Introduce spawning of bombers
- Create and place cities that can take damage when an enemy missile hits them.
	- Could be that game_data needs an "attackable" array, which is simply the concatenation of silos and cities
	- Cities need some concept of health
- Defeating or surviving waves should lead into playing new waves
- Enemy missiles in the original game could split into multiple warheads partway through their flight.
	- This can be another knob to turn as we increase difficulty over time
- We need to introduce a new smart bomb type, which avoids friendly missiles on it's way to the target
- We need to introduce a bomber type, which is destructible itself, but also launches missiles as it travels horizontally through the screen.
- Save and track scores

## Notes
- On a new game, player health and ammunition should be reset
- Godots pause functionality doesn't stop signals from propogating.
	- This could be a problem since I pretty much rely entirely on signals for game logic.
