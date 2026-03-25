"
Moose name builder for FamixEF entities that add value informations.
"
Class {
	#name : 'FamixEFValueMooseNameBuilder',
	#superclass : 'FamixEFMooseNameBuilder',
	#category : 'Famix-ExecutionFlow-Value-Entities-Extensions',
	#package : 'Famix-ExecutionFlow-Value-Entities-Extensions'
}

{ #category : 'class initialization' }
FamixEFValueMooseNameBuilder class >> initialize [

	self beCurrent
]

{ #category : 'printing' }
FamixEFValueMooseNameBuilder >> mooseNameOfMethodCall: methodCall on: aStream [

	methodCall receiver ifNotNil: [ :receiver |
		receiver mooseNameOn: aStream.
		aStream nextPut: $. ].
	super mooseNameOfMethodCall: methodCall on: aStream.
	aStream nextPut: $(.
	methodCall arguments
		do: [ :argument | argument mooseNameOn: aStream ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $).
	methodCall result ifNotNil: [ :result |
		aStream nextPutAll: '->'.
		result mooseNameOn: aStream ]
]
