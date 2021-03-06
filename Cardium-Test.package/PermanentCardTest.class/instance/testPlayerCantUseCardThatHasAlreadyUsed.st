tests
testPlayerCantUseCardThatHasAlreadyUsed
	| aCardGivingTile game seba board dice dice1 totalPlayers boardGenerator generator anOverloadCard deckGenerator cards|
	seba := Player named: 'sebastian'.
	aCardGivingTile := CardGivingEffect new.
	anOverloadCard := Overload new.	
	cards := OrderedCollection new.
	cards add: anOverloadCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	deckGenerator := DeckFixedGenerator using: cards.
	board := Board ofSize: 10 withThisGenerator: boardGenerator.
	generator := FixedNumberGenerator startFrom: 3.
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
	
	game thePlayer: seba appliesPermanent: anOverloadCard on: seba.
	
	self
		should: [ game thePlayer: seba appliesPermanent: anOverloadCard on: seba ]
		raise: GameError
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Player doesnt have this card' ]