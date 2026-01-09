
# TODO

## Critical
- When the game loads in, there should be a countdown to the game start, and thereon on new waves
	- New waves should have increasing difficulty, in enemy missile quantity, speed of launch, and missile speed
	- Introduce spawning of smart bombs
	- Introduce spawning of bombers
- Create and place cities that can take damage when an enemy missile hits them.
	- Could be that game_data needs an "attackable" array, which is simply the concatenation of silos and cities
	- Cities need some concept of health
- Determine when a missile epxlosion hits something, either enemy missile or city/silo
	- When a missile hits an explosion, it too should explode
	- When a missile hits a city, that city should take damage
	- When a missile hits a silo, that silo should lose some ammo
- Enemy missiles in the original game could split into multiple warheads partway through their flight.
	- I think this requires completely reworking a Missile such that the Explosion type is actually in the scene tree
		- Even this didn't work correctly. I'm clearly not understanding collisions in Godot and must do some studying.
			- Try starting [at Godots physics docs](https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html)
		- I put the explosion in the Missile Scene Tree.
		- I wired it up so that the missile would print to the console whenever it's warhead detected another area entering it.
			- On startup this would fire a bunch of times for enemy missiles.
			- When I would fire one missile it would immediately fire as soon as I clicked the mouse
			- Then it would not fire ever again.
			- This can be seen in the branch "missiles-do-damage"
	- This can be another knob to turn as we increase difficulty over time
- We need to introduce a new smart bomb type, which avoids friendly missiles on it's way to the target
- We need to introduce a bomber type, which is destructible itself, but also launches missiles as it travels horizontally through the screen.
- Save and track scores

## Notes

