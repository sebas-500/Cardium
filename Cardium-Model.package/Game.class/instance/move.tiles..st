action
move: aPlayer tiles: movesToBeMade 
	
	| positionsHistory  currentPosition |
	positionsHistory := playerPositions at:(aPlayer).		
	currentPosition := (self positionOf: aPlayer).
	positionsHistory add:( positionCalculator calculateNewPositionUsing:  currentPosition inThis: board havingThisNew: 	movesToBeMade). 