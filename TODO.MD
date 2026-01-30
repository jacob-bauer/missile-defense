
# TODO

## Immediate Scratch pad
- That's alot. Nearly as much work as the rest of the game so far
	- Let's just generate a line graph of scores over time, without even any axes values
	- We can make it really simple then, as we don't have to care about distances between dates
		- Instead, each data point is just "the next time the user played"
		- So the graph becomes "score over plays"
- Save and track scores
	- We'll need a graph scene from the main menu where we can display a graph of scores over time
		- The graph should properly scale all axes based on the minimum and maximum values on that axes
		- There should be three graphing options:
			1) Score over time
			2) Wave over time
			3) Score/Wave over time
		- There should be a visual line graph of data
			- Which can handle zero or more data points
		- There should be a scrollable window of all of the entries.
			- Selecting an entry in the list should highlight it in the graph, and vice versa
## Bugs

## Critical
- Scoring is incorrect. Reference conversation with chatGPT about scoring
- Playtesting shows that we need slower initial difficulty growth
	- So that we can start with i.e. 5 missiles, then grow by one each wave to 10, with no speed increase, and then by like 10% per wave over base each wave thereafter
- Playtesting shows that we need to limit the maximum speed of enemy missiles
	- I missed when exactly laurie said that speed became too great during her play test
		- Laurie said 50 pixels per second was too much
		- Jacob said 70 pixels per second was too much.
			- Although I took my first damage at speed 55
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

## Juice
- The score should tick up over time where it can, and the score that can't should be "bonus score" at the end of the round

## Notes

