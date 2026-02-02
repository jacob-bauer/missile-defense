
# TODO

## Immediate Scratch pad

## Bugs


## Critical
- Playtesting shows that we need slower initial difficulty growth
	- So that we can start with i.e. 5 missiles, then grow by one each wave to 10, with no speed increase, and then by like 10% per wave over base each wave thereafter
	- We also need to control how friendly ammunition grows
	- This is described by a sigmoid function. Ammunition should also grow somewhat as well.
- Playtesting shows that we need to limit the maximum speed of enemy missiles
	- I missed when exactly laurie said that speed became too great during her play test
		- Laurie said 50 pixels per second was too much
		- Jacob said 70 pixels per second was too much.
			- Although I took my first damage at speed 55
		- CJ crapped out at 65 pixels per second
	- I need to instrument enemy missile speed and hold another playtest
	- So enemy missile speed should grow by 10% each wave and I need to not when laurie complains
	- Then set the limit 10% higher than that
- Enemy missiles in the original game could split into multiple warheads partway through their flight.
	- This can be another knob to turn as we increase difficulty over time
- We need to introduce a new smart bomb type, which avoids friendly missiles on it's way to the target
- We need to introduce a bomber type, which is destructible itself, but also launches missiles as it travels horizontally through the screen.
		
## Non-Critical
- Every certain number of points, if a player has lost a city, a random city will reappear in it's position
- When paused or on game over, we should hide the missile trails. They make it very hard to see the menu.
- Refactor logger so that we don't have to manually create a LogMessage object. We just pass in the message data

## Juice
- The score should tick up over time where it can, and the score that can't should be "bonus score" at the end of the round

## Notes

