
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
	- I'm still having bugs. I think they are do to the position of the area2d node not actually following the trail of the missile until the explosion.
		- So, how do I solve this?
		- I think this can be solved by getting rid of SmokeTrail, and just doing it right in missile.gd
		- This way, I can move the missile right along with the head of the trail.
	- When an enemy missile hits an explosion, it too should explode
	- When a missile hits a city, that city should take damage
	- When a missile hits a silo, that silo should lose some ammo
- Enemy missiles in the original game could split into multiple warheads partway through their flight.
	- This can be another knob to turn as we increase difficulty over time
- We need to introduce a new smart bomb type, which avoids friendly missiles on it's way to the target
- We need to introduce a bomber type, which is destructible itself, but also launches missiles as it travels horizontally through the screen.
- Save and track scores

## Notes

