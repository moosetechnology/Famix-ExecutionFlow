Class {
	#name : 'FamixEFMooseNameBuilderAbstractTest',
	#superclass : 'TestCase',
	#instVars : [
		'methodCall'
	],
	#category : 'Famix-ExecutionFlow-Tests',
	#package : 'Famix-ExecutionFlow-Tests'
}

{ #category : 'testing' }
FamixEFMooseNameBuilderAbstractTest class >> isAbstract [

	^ self == FamixEFMooseNameBuilderAbstractTest
]

{ #category : 'accessing' }
FamixEFMooseNameBuilderAbstractTest >> buildMooseName [

	^ String streamContents: [ :s |
		  self builder mooseNameOfMethodCall: methodCall on: s ]
]

{ #category : 'configuring' }
FamixEFMooseNameBuilderAbstractTest >> builder [

	self subclassResponsibility
]

{ #category : 'running' }
FamixEFMooseNameBuilderAbstractTest >> setUp [

	super setUp.
	methodCall := FamixEFDirectMethodCall new method:
		              (FamixStMethod named: 'origin')
]
