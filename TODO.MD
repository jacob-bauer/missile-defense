
# TODO

## Critical
- Create a city that can take damage when an enemy missile hits it
- Launch enemy missiles
- Determine when a missile explosion hits something, either enemy missile or city/silo

## Notes
- getting silos_with_ammo from game_data.gd is bugged where it tries to determine when to send the game_over signal
	- Spefically, it has an off by one error (you have to request the list of silos once more AFTER the last missile has fired)
