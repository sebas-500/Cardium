tests
testWhenUndoAppliedWithAnnulmentTheEffectUndoes
	|   game seba board dice dice1 totalPlayers boardGenerator generator  deckGenerator cards anUndoCard aCardGivingTile anAnnulmentCard aSpeedCard |
	seba := Player named: 'sebastian'.	
	aCardGivingTile := CardGivingEffect new.
	anUndoCard := Undo new.	
	anAnnulmentCard := Annulment new.
	aSpeedCard := Speed new.
	cards := OrderedCollection new.	
	cards add: anUndoCard.
	cards add: anAnnulmentCard.
	cards add: aSpeedCard.
	boardGenerator := TileFixedGenerator using: aCardGivingTile.
	deckGenerator := DeckFixedGenerator using: cards.
	board := Board ofSize: 17 withThisGenerator: boardGenerator.
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
	self assert: (game positionOf: seba) tiles equals: 0.
   self assert: (game positionOf: seba) rounds equals: 0.		
	game nextTurn: seba.
	game thePlayer: seba appliesPermanent: aSpeedCard on: seba.
	self assert: (game positionOf: seba) tiles equals: 1.
   self assert: (game positionOf: seba) rounds equals: 0.	
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 4.
   self assert: (game positionOf: seba) rounds equals: 0.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 8.
   self assert: (game positionOf: seba) rounds equals: 0.
	game thePlayer: seba applies: anAnnulmentCard toCancel:aSpeedCard  effectOnPlayer: seba.
	game thePlayer: seba applies: anUndoCard.
	game nextTurn: seba.
	self assert: (game positionOf: seba) tiles equals: 13.
   self assert: (game positionOf: seba) rounds equals: 0.