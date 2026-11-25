Class {
	#name : 'MyChessSquare', "Je vais m'attaquer à cette classe pour le kata refactor piece rendering"
	#superclass : 'BlElement',
	#instVars : [
		'color',
		'name',
		'label',
		'piece',
		'contents',
		'board',
		'target'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'api - text weight' }
MyChessSquare class >> black [

	^ self color: Color black
]

{ #category : 'api - text weight' }
MyChessSquare class >> color: aColor [

	^ self basicNew
		  color: aColor;
		  initialize;
		  yourself
]

{ #category : 'api - text weight' }
MyChessSquare class >> white [

	^ self color: Color white
]

{ #category : 'arithmetic' }
MyChessSquare >> + aPoint [

	| column file |
	column := (self column asciiValue + aPoint x) asCharacter asString.
	file := (self file asciiValue + aPoint y) asCharacter asString.

	^ board at: column , file ifAbsent: [ ^ nil ]
]

{ #category : 'accessing' }
MyChessSquare >> board [
	^ board
]

{ #category : 'accessing' }
MyChessSquare >> board: aMyChessBoard [ 
	
	board := aMyChessBoard
]

{ #category : 'initialization' }
MyChessSquare >> click [

	board click: self
]

{ #category : 'accessing' }
MyChessSquare >> color [

	^ color
]

{ #category : 'accessing' }
MyChessSquare >> color: anObject [

	color := anObject
]

{ #category : 'accessing' }
MyChessSquare >> column [
	
	^ name first
]

{ #category : 'accessing' }
MyChessSquare >> contents [
	^ contents
]

{ #category : 'accessing' }
MyChessSquare >> contents: aPiece [

	| text |
	contents := aPiece.

	text := contents
		        ifNil: [
			        color isBlack
				        ifFalse: [ 'z' ]
				        ifTrue: [ 'x' ] ]
		        ifNotNil: [ contents renderPieceOn: self ].
	piece text: (text asRopedText
			 fontSize: 48;
			 foreground: self foreground;
			 fontName: MyOpenChessDownloadedFont new familyName)
]

{ #category : 'api - configuration' }
MyChessSquare >> down [

	^ self + (0 @ -1)
]

{ #category : 'asd' }
MyChessSquare >> emptyContents [
	
	self contents: nil
]

{ #category : 'accessing' }
MyChessSquare >> file [
	
	^ name second
]

{ #category : 'accessing' }
MyChessSquare >> foreground [
			
	^ color isBlack
		ifTrue: [ board blackColor ]
		ifFalse: [ board whiteColor ]
]

{ #category : 'testing' }
MyChessSquare >> hasPiece [
	
	^ contents isNil not
]

{ #category : 'highlighting' }
MyChessSquare >> highlightTarget [

	self addChild: target
]

{ #category : 'rendering' }
MyChessSquare >> tableDispatchBuildWith: a
    whitePieceOnBlackSquare: b
    blackPieceOnWhiteSquare: c
    blackPieceOnBlackSquare: d [
    ^ Dictionary newFrom: {
        (true -> (Dictionary newFrom: {
            (false -> a).
            (true -> b)
        })).
        (false -> (Dictionary newFrom: {
            (false -> c).
            (true -> d)
        }))
    }
]

{ #category : 'initialization' }
MyChessSquare >> initialize [

	super initialize.
	target := BlElement new
		  geometry: BlCircleGeometry new;
		  background: (Color gray alpha: 0.3).

	self layout: BlFrameLayout new.

	label := BlTextElement new.
	label constraintsDo: [ :c | c padding: (BlInsets all: 3) ].

	piece := BlTextElement new.
	piece text: '' asRopedText.
	piece constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].

	self
		addChild: label;
		addChild: piece.
	self
		background: Color white;
		geometry: BlSquareGeometry new.

	self addEventHandlerOn: BlClickEvent do: [ :e | self click ]
]

{ #category : 'accessing' }
MyChessSquare >> left [

	^ self + (-1 @ 0)
]

{ #category : 'accessing' }
MyChessSquare >> name [
	^ name
]

{ #category : 'accessing' }
MyChessSquare >> name: aString [

	name := aString.
	label text: (name asRopedText foreground: color negated)
]

{ #category : 'printing' }
MyChessSquare >> printOn: aStream [
	"Generate a string representation of the receiver based on its instance variables."

	super printOn: aStream.
	aStream
		nextPutAll: ' name: ';
		print: name
]

{ #category : 'rendering' }
MyChessSquare >> renderBishop: aPiece [
	| table |
	table := self
		         tableDispatchBuildWith: 'B'
	         whitePieceOnBlackSquare: 'b'
	         blackPieceOnWhiteSquare: 'V'
	         blackPieceOnBlackSquare: 'v'.
	^ (table at: aPiece isWhite) at: color isBlack
]
{ #category : 'rendering' }
MyChessSquare >> renderKing: aPiece [
	| table |
	table := self
		         tableDispatchBuildWith: 'K'
	         whitePieceOnBlackSquare: 'k'
	         blackPieceOnWhiteSquare: 'L'
	         blackPieceOnBlackSquare: 'l'.
	^ (table at: aPiece isWhite) at: color isBlack
]

{ #category : 'rendering' }
MyChessSquare >> renderKnight: aPiece [
	| table |
	table := self
		         tableDispatchBuildWith: 'N'
	         whitePieceOnBlackSquare: 'n'
	         blackPieceOnWhiteSquare: 'M'
	         blackPieceOnBlackSquare: 'm'.
	^ (table at: aPiece isWhite) at: color isBlack
]

{ #category : 'rendering' }
MyChessSquare >> renderPawn: aPiece [
	| table |
	table := self
		         tableDispatchBuildWith: 'P'
		         whitePieceOnBlackSquare: 'p'
		         blackPieceOnWhiteSquare: 'O'
		         blackPieceOnBlackSquare: 'o'.
	^ (table at: aPiece isWhite) at: color isBlack
]

{ #category : 'rendering' }
MyChessSquare >> renderQueen: aPiece [
	| table |
	table := self
		         tableDispatchBuildWith: 'Q'
	         whitePieceOnBlackSquare: 'q'
	         blackPieceOnWhiteSquare: 'W'
	         blackPieceOnBlackSquare: 'w'.
	^ (table at: aPiece isWhite) at: color isBlack
]

{ #category : 'rendering' }
MyChessSquare >> renderRook: aPiece [
	| table |
	table := self
		         tableDispatchBuildWith: 'R'
	         whitePieceOnBlackSquare: 'r'
	         blackPieceOnWhiteSquare: 'T'
	         blackPieceOnBlackSquare: 't'.
	^ (table at: aPiece isWhite) at: color isBlack
]

{ #category : 'accessing' }
MyChessSquare >> right [
	
	^ self + (1@0)
]

{ #category : 'initialization' }
MyChessSquare >> select [
	
	self border: Color green
]

{ #category : 'highlighting' }
MyChessSquare >> unhighlightTarget [

	self removeChild: target
]

{ #category : 'initialization' }
MyChessSquare >> unselect [

	self border: BlBorder empty
]

{ #category : 'instance creation' }
MyChessSquare >> up [
	
	^ self + (0@1)
]
