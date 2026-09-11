Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testPawnCanEatDiagonnaly [
	| board pawn enemy targets| 
	board := MyChessBoard empty. 
	pawn := MyPawn white. 
	enemy := MyPawn black. 
	
	board at: 'e2' put: pawn. 
	board at: 'f3' put: enemy. 
	
	targets := pawn targetSquaresLegal: true.
	
	self assert: (targets  includes: (board at: 'f3')).  
	
	
]

{ #category : 'tests' }
MyPawnTest >> testPawnCannotEatForward [
	| board pawn enemy targets| 
	board := MyChessBoard empty. 
	pawn := MyPawn white. 
	enemy := MyPawn black. 
	
	board at: 'e2' put: pawn. 
	board at: 'e3' put: enemy. 
	
	targets := pawn targetSquaresLegal: true.
	
	self assert: targets isEmpty.  
	
	
	
	
	 
	
]

{ #category : 'tests' }
MyPawnTest >> testPawnMoveTwoTimeAtInit [ 
	| board pawn targets|
	
	 
	
	board := MyChessBoard empty. 	
	pawn := MyPawn white.

	board at: 'e2' put: pawn. 
	
	targets := pawn targetSquaresLegal: true.
	
	self assert: (targets includes: (board at: 'e3')).
	self assert: (targets includes: (board at: 'e4')).
	
	
	
	
	
	
	
	
  
]
