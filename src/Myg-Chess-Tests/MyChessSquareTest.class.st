Class {
	#name : 'MyChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareTest >> testRenderBishop [
	self assert: (MyBishop white renderPieceOn: MyChessSquare white) equals: 'B'.
	self assert: (MyBishop white renderPieceOn: MyChessSquare black) equals: 'b'.
	self assert: (MyBishop black renderPieceOn: MyChessSquare white) equals: 'V'.
	self assert: (MyBishop black renderPieceOn: MyChessSquare black) equals: 'v'
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderKing [
	self assert: (MyKing white renderPieceOn: MyChessSquare white) equals: 'K'.
	self assert: (MyKing white renderPieceOn: MyChessSquare black) equals: 'k'.
	self assert: (MyKing black renderPieceOn: MyChessSquare white) equals: 'L'.
	self assert: (MyKing black renderPieceOn: MyChessSquare black) equals: 'l'
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderKnight [
	self assert: (MyKnight white renderPieceOn: MyChessSquare white) equals: 'N'.
	self assert: (MyKnight white renderPieceOn: MyChessSquare black) equals: 'n'.
	self assert: (MyKnight black renderPieceOn: MyChessSquare white) equals: 'M'.
	self assert: (MyKnight black renderPieceOn: MyChessSquare black) equals: 'm'
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderPawn [
	self assert: (MyPawn white renderPieceOn: MyChessSquare white) equals: 'P'.
	self assert: (MyPawn white renderPieceOn: MyChessSquare black) equals: 'p'.
	self assert: (MyPawn black renderPieceOn: MyChessSquare white) equals: 'O'.
	self assert: (MyPawn black renderPieceOn: MyChessSquare black) equals: 'o'
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderQueen [
	self assert: (MyQueen white renderPieceOn: MyChessSquare white) equals: 'Q'.
	self assert: (MyQueen white renderPieceOn: MyChessSquare black) equals: 'q'.
	self assert: (MyQueen black renderPieceOn: MyChessSquare white) equals: 'W'.
	self assert: (MyQueen black renderPieceOn: MyChessSquare black) equals: 'w'
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderRook [
	self assert: (MyRook white renderPieceOn: MyChessSquare white) equals: 'R'.
	self assert: (MyRook white renderPieceOn: MyChessSquare black) equals: 'r'.
	self assert: (MyRook black renderPieceOn: MyChessSquare white) equals: 'T'.
	self assert: (MyRook black renderPieceOn: MyChessSquare black) equals: 't'
]