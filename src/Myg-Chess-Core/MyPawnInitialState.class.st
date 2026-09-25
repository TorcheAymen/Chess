Class {
	#name : 'MyPawnInitialState',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPawnInitialState >> forwardSquaresFor: aPawn [
	| sq s1 s2 |
	sq := aPawn square.

	aPawn isWhite
		ifTrue: [
			s1 := sq up.
			s2 := s1 up. ]
		ifFalse: [
			s1 := sq down.
			s2 := s1 down. ].

	"Case 1 absente ou occupée : rien"
	(s1 isNil or: [ s1 hasPiece ]) ifTrue: [ ^ #() ].

	"Case 2 absente ou occupée : seulement case 1"
	(s2 isNil or: [ s2 hasPiece ]) ifTrue: [ ^ { s1 } ].

	"Les deux sont libres"
	^ { s1 . s2 }
]
