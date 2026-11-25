# Second KATA

## Intuition 

La classe MyCHessSquare a pleins de méthodes render (une pour chaque type de pièce). 

C'est une très bonne chose d'avoir dispatché de cette manière les méthodes, de sorte à ne pas faire de if Bishop, if King etc etc. 

Par contre il reste un problème : le choix du rendement dans la méthode est très mal géré pour 2 raisons : 
1. Le code est largement dupliqué entre les méthodes : à voir si le table dispatch corrige ça mais j'en suis pas sur. 
2. La logique fonctionne mais mon dieu c'est affreux tous ces if. 

## Theorie 

Je n'ai pas bien compris le table dispatch alors je vais rédiger quelques lignes pour m'aider à comprendre. 

Le table dispatch, c’est remplacer une série de conditions par une table de hashage qui fait correspondre le rendement avec la couleur de la pièce dans une relation clé (bool) / valeur (hashtable). La seconde hashtable fait correspondre la couleur de la case avec la valeur du rendement dans une relation clé (bool) valeur (rendement, une lettre ici)

voici ce que ça pourrait donner, c'est peu élégant mais ça illustre la solution : 

MyChessSquare >> renderRook: aPiece [
    | table |

    table := Dictionary newFrom: {
        (true -> (Dictionary newFrom: {
            (false -> 'R').
            (true -> 'r')
        })).
        (false -> (Dictionary newFrom: {
            (false -> 'T').
            (true -> 't')
        }))
    }.

    ^ (table at: aPiece isWhite) at: color isBlack
]

/!\ ici c'est pas beau parce que je construit une hashmap directement dans la méthode, mais dans la solution je ferais une méthode intermédiaire pour éviter la duplication de code. /!\


## Plan d'action 

Je propose de faire du TDD, d'abord rédiger les test, puis les méthodes puis de refactoriser la classe MyChessSquare et enfin tester. 


### TDD 

J'ai rédigé la première série de test; il y'en avait beaucoup (6 pièces) donc j'ai demandé à l'IA de rédiger les autres qui sont pareils. 

MyChessSquareTest >> testRenderBishop [
	self assert: (MyBishop white renderPieceOn: MyChessSquare white) equals: 'B'.
	self assert: (MyBishop white renderPieceOn: MyChessSquare black) equals: 'b'.
	self assert: (MyBishop black renderPieceOn: MyChessSquare white) equals: 'V'.
	self assert: (MyBishop black renderPieceOn: MyChessSquare black) equals: 'v'
]


### Execution 

je commence par faire la première méthode intermédiaire : celle qui initialise la table de dispatch 

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