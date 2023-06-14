Class {
	#name : #FireAutomataCellTest,
	#superclass : #TestCase,
	#instVars : [
		'cell'
	],
	#category : #'FireAutomata-Model-Tests'
}

{ #category : #initialization }
FireAutomataCellTest >> setUp [ 

	super setUp.
	cell := FireAutomataCell new.
]

{ #category : #tests }
FireAutomataCellTest >> testEntityName [ 

	self assert: cell class entityName equals: 'Cell'
]

{ #category : #tests }
FireAutomataCellTest >> testGenerateTree [

	cell generateTree.
	self assert: cell isTreeCell.
]

{ #category : #tests }
FireAutomataCellTest >> testGenerateTreeWithProbability [
	
	"With random seed 42 the PMFishmanMooreRandomGenerator generates the following numbers:
	#(0.53 0.46 0.13 0.01 0.20 0.56 0.47 0.55 0.31 0.77)
	
	This means that if we ask a cell 4 times to generate a tree with probability 0.1,
	then the first 3 times, nothing will happen. And on the 4th request, the tree will appear."
	
	Cormas randomGenerator: (PMFishmanMooreRandomGenerator seed: 42).
	
	3 timesRepeat: [ 
		cell generateTreeWithProbability: 0.1.
		self deny: cell isTreeCell ].
	
	cell generateTreeWithProbability: 0.1.
	self assert: cell isTreeCell.
]

{ #category : #tests }
FireAutomataCellTest >> testInitializedEmpty [

	self assert: cell isEmptyCell
]

{ #category : #tests }
FireAutomataCellTest >> testNewState [

	cell setOnFire.
	cell state iterationsToBurn: 3.
	
	3 timesRepeat: [ 
		self assert: cell isFireCell.
		
		cell newState.
		cell updateState ].
	
	self assert: cell isAshCell.
]

{ #category : #tests }
FireAutomataCellTest >> testPov [

	self assert: cell pov isColor.
]

{ #category : #tests }
FireAutomataCellTest >> testSetOnFire [

	cell setOnFire.
	self assert: cell isFireCell.
]
