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

	methodCall method
		ifNil: [ aStream nextPutAll: '<method?>' ]
		ifNotNil: [ :method |
			methodCall receiver
				ifNil: [ aStream nextPutAll: '<container?>' ]
				ifNotNil: [ :receiver | receiver mooseNameOn: aStream ].
			aStream nextPut: $..
			aStream nextPutAll: method name ].

	aStream nextPut: $(.
	methodCall arguments
		do: [ :argument | argument mooseNameOn: aStream ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $).

	methodCall result ifNotNil: [ :result |
		aStream nextPutAll: '->'.
		result mooseNameOn: aStream ]
]
