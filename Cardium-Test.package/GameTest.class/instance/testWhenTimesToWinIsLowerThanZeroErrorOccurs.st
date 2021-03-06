tests
testWhenTimesToWinIsLowerThanZeroErrorOccurs
	| player board dice dice1 dice2 |
	player := Player named: 'pepito'.
	board := Board ofSize: 10 withThisGenerator: TileRandomGenerator new.
	dice1 := Dice faces: 6.
	dice2 := Dice faces: 7.
	dice := Array with: dice1 with: dice2.
	self
		should: [ Game
				rounds: 0
				playedBy: player
				withThisBoard: board
				usingDice: dice
				withThis: (DeckFixedGenerator using: Speed new) ]
		raise: GameError