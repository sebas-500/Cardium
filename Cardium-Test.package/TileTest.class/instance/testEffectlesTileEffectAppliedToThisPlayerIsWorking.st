tests
testEffectlesTileEffectAppliedToThisPlayerIsWorking

	| anEffectlesTile game seba board dice dice1 totalPlayers |
	
	seba := Player named: 'sebastian'.
	board := Board ofSize: 10.
	dice1 := Dice faces: 6.
	dice1 setValue: 1.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	game := Game	 rounds: 1 playedBy: totalPlayers withThisBoard: board usingDice: dice.
	
	anEffectlesTile := Effectles new.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tile equals:0.
	anEffectlesTile appliesEffectOn: game allPlayersPositions playing: seba.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tile equals:0.
	
	