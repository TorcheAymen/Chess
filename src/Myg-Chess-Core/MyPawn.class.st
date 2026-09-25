Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'state'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPawn >> attackingSquares [

	| sqre forward |
	sqre := self square.

	forward := self isWhite
		                      ifTrue: [ sqre up ]
		                      ifFalse: [ sqre down ].

	^ {
		  forward left.
		  forward right }
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> initialize [
	super initialize.
	state := MyPawnInitialState new.
]

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [
	super moveTo: aSquare .
state := MyPawnMovedState new.
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	| forwardMoves captureMoves | 
	
	forwardMoves := state forwardSquaresFor: self .
	"[ :eachSquare | eachSquare notNil and:  [ eachSquare hasPiece not ] ]"
	
	captureMoves := self attackingSquares select: [ :eachSquare | eachSquare notNil and:  [ eachSquare hasPiece ]   ].
	
	^  forwardMoves , captureMoves 
	
	
	
]
