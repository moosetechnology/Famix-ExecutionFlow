"
Default moose name builder for FamixEF entities.
The `current` builder is the strategy in use, which can be a subclass.
"
Class {
	#name : 'FamixEFMooseNameBuilder',
	#superclass : 'Object',
	#classVars : [
		'Current'
	],
	#category : 'Famix-ExecutionFlow-Entities-Extensions',
	#package : 'Famix-ExecutionFlow-Entities-Extensions'
}

{ #category : 'configuring' }
FamixEFMooseNameBuilder class >> beCurrent [

	Current := self new
]

{ #category : 'accessing' }
FamixEFMooseNameBuilder class >> current [

	^ Current
]

{ #category : 'class initialization' }
FamixEFMooseNameBuilder class >> initialize [

	self beCurrent
]

{ #category : 'printing' }
FamixEFMooseNameBuilder >> mooseNameOfMethodCall: methodCall on: aStream [

	aStream nextPutAll: (methodCall method
			 ifNotNil: [ :method | method name ]
			 ifNil: [ '<unknownMethod>' ])
]
