Class {
	#name : 'MyPawnMovedState',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPawnMovedState >> forwardSquaresFor: aPawn [
	|square candidates| 
	square := aPawn square. 
	
	candidates := aPawn isWhite 
				ifTrue: [ { square up } ]
				ifFalse: [ { square down } ].
				
	^ candidates select: [ :eachSquare | eachSquare notNil and:  [ eachSquare hasPiece not ] ]
	
]
