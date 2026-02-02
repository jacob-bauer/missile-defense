
# TODO

## Immediate Scratch pad
- Revamp scoring:
	- I need to know how many enemy missiles are destroyed
	- I need to know the remaining city block health at the end of a wave
	- I need to know the remaining ammunition at the end of a wave

## Bugs


## Critical
- Scoring is incorrect. Reference conversation with chatGPT about scoring
	- Destroying an enemy missile: 25
	- City survives Wave: 100
	- Ammo remaining: 5 per missile
	
	- These scores get multiplied by the current wave number
	- We also have to get the balance of friendly ammo to enemy ammunition right
- Playtesting shows that we need slower initial difficulty growth
	- So that we can start with i.e. 5 missiles, then grow by one each wave to 10, with no speed increase, and then by like 10% per wave over base each wave thereafter
- Playtesting shows that we need to limit the maximum speed of enemy missiles
	- I missed when exactly laurie said that speed became too great during her play test
		- Laurie said 50 pixels per second was too much
		- Jacob said 70 pixels per second was too much.
			- Although I took my first damage at speed 55
		- CJ crapped out at 65 pixels per second
	- I need to instrument enemy missile speed and hold another playtest
	- So enemy missile speed should grow by 10% each wave and I need to not when laurie complains
	- Then set the limit 10% higher than that
- Player should earn health at certain point thresholds
		- Instead, after a certain number of points, a destroyed city, if one exists will be selected at random and rebuilt.
- Enemy missiles in the original game could split into multiple warheads partway through their flight.
	- This can be another knob to turn as we increase difficulty over time
- We need to introduce a new smart bomb type, which avoids friendly missiles on it's way to the target
- We need to introduce a bomber type, which is destructible itself, but also launches missiles as it travels horizontally through the screen.
- Save and track scores
	- Should the players score be saved when quitting early? I.e. by pressing the x on the window?
		- No. It shouldn't.
		
## Non-Critical
- Every certain number of points, if a player has lost a city, a random city will reappear in it's position
- When paused or on game over, we should hide the missile trails. They make it very hard to see the menu.
- Refactor logger so that we don't have to manually create a LogMessage object. We just pass in the message data

## Juice
- The score should tick up over time where it can, and the score that can't should be "bonus score" at the end of the round

## Notes

