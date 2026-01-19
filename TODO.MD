
# TODO

## Immediate Scratch pad
- While we are at it, go ahead and improve the art for the silo
	- It should just look prettier
	- It needs to have animations for ammo quantity
	- It needs to have animations for taking damage
- And the city also needs a better background than a grey rectangle

# Critical
- Thoroughly define how rounds and games are scored.
- There is a bug where, at larger screen sizes, missiles may come in from very low on the side of the screen instead of from the top.
	- The cause is not immediately apparent
- Implement a pause menu
	- Allow to quit
	- Allow to restart game
	- Allow to return to main menu
	- Will show us how to pause game, but still show and interact with some UI elements during pause
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

## Notes
- Godots pause functionality doesn't stop signals from propogating.
	- This could be a problem since I pretty much rely entirely on signals for game logic.
