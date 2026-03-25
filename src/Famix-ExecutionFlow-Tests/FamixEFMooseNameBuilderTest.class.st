Class {
	#name : 'FamixEFMooseNameBuilderTest',
	#superclass : 'FamixEFMooseNameBuilderAbstractTest',
	#category : 'Famix-ExecutionFlow-Tests',
	#package : 'Famix-ExecutionFlow-Tests'
}

{ #category : 'configuring' }
FamixEFMooseNameBuilderTest >> builder [

	^ FamixEFMooseNameBuilder new
]

{ #category : 'tests' }
FamixEFMooseNameBuilderTest >> testMooseNameOn [

	self assert: self buildMooseName equals: '<container?>.origin'
]

{ #category : 'tests' }
FamixEFMooseNameBuilderTest >> testMooseNameOnUnknownMethod [

	methodCall method: nil.
	self assert: self buildMooseName equals: '<method?>'
]
