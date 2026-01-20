
# TODO

## Immediate Scratch pad
- In the Silo._ready() function we should select a random starting frame for the radar rotation, otherwise they are all perfectly matched

# Critical
- Thoroughly define how rounds and games are scored.
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

## Non-Critical
- Add a counter for remaining enemy missiles to the hud
- Figure out something better with the color schemes. This isn't working for me

## Notes
- Godots pause functionality doesn't stop signals from propogating.
	- This could be a problem since I pretty much rely entirely on signals for game logic.
