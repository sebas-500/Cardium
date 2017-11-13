tests
testWhenSpeedCardIsAppliedThePlayerMovesOnePlusWhatTheDiceSays
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator aSpeedCard deckGenerator cards |
	seba := Player named: 'sebastian'.
	aCardGivingTile := CardGiving new.
	aSpeedCard := Speed new.
	cards := OrderedCollection new.
	cards add: aSpeedCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	deckGenerator := DeckFixedGenerator using: cards.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 0.
	dice1 := Dice faces: 6 rollingFrom: generator.
	dice := Array with: dice1.
	totalPlayers := OrderedCollection new.
	totalPlayers add: seba.
	game := Game
		rounds: 1
		playedBy: totalPlayers
		withThisBoard: board
		usingDice: dice
		withThis: deckGenerator.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 0.
	game nextTurn: seba.
	game thePlayer: seba appliesPermanent: aSpeedCard on: seba.
	game nextTurn: seba.
	self assert: (game positionOf: seba) rounds equals: 0.
	self assert: (game positionOf: seba) tiles equals: 4.