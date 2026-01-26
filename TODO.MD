
# TODO

## Immediate Scratch pad
- Enemy Launcher needs to have a function to reset to a new wave
	- Based on the wave, the number of missiles will increase, to a certain maximum (let's try 100)
	- Based on the wave, the missile speed will increase, to a certain maximum (let's try 125 pixels per second)
	- At what rate should these increases occur?
		- Maybe, base_setting * 0.1 * wave when wave > 1

# Bugs
- You can still shoot missiles while waiting for the countdown
- When two enemy missiles collide they will explode even if one of them has not been detonated by a friendly missile yet
	- The intended behavior is that an enemy missile will only explode when colliding with either a friendly missile explosion or an enemy missile explosion
# Critical
- Failing a wave should lead into a game over mode
	- You should be able to save a high score
	- You should be able to restart
	- You should be able to quit to menu
	- You should be able to quit to desktop
- Defeating or surviving waves should lead into playing new waves
- Enemy missiles in the original game could split into multiple warheads partway through their flight.
	- This can be another knob to turn as we increase difficulty over time
- We need to introduce a new smart bomb type, which avoids friendly missiles on it's way to the target
- We need to introduce a bomber type, which is destructible itself, but also launches missiles as it travels horizontally through the screen.
- Save and track scores
	- Should the players score be saved when quitting early? I.e. by pressing the x on the window?

## Non-Critical

## Notes

