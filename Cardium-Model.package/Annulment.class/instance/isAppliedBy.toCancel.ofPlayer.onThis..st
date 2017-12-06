testing
isAppliedBy: aPlayer toCancel: aCard ofPlayer: aTarget onThis: aGame
	| anAnnulmentEffect |
	aTarget assertHisAffectingDeckHas: aCard.
	aPlayer assertHisDeckHas: self.
	aPlayer removeFromDeck: self.
	aCard hasToBeRemovedFromCardsAffecting: aTarget.
	
	anAnnulmentEffect := AnnulmentEffect onPlayer: aTarget 	toCancel: aCard. 
	aGame addToAllCardsUsed: anAnnulmentEffect