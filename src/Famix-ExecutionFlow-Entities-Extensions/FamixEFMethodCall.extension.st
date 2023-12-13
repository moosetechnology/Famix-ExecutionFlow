Extension { #name : #FamixEFMethodCall }

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> ancestors [

	| ancestors |
	ancestors := OrderedCollection new.
	self ancestorsDo: [ :call | ancestors add: call ].
	^ ancestors
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> ancestorsDo: aBlock [

	caller ifNotNil: [
		aBlock value: caller.
		caller ancestorsDo: aBlock ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> descendants [

	| descendants |
	descendants := OrderedCollection new.
	self descendantsDo: [ :call | descendants add: call ].
	^ descendants
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> descendantsDo: aBlock [

	calls do: [ :call |
		aBlock value: call.
		call descendantsDo: aBlock ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> following [

	| following |
	following := OrderedCollection new.
	self followingDo: [ :call | following add: call ].
	^ following
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> followingDo: aBlock [

	nextSibling ifNotNil: [ nextSibling privateFollowingDo: aBlock ].
	caller ifNotNil: [ caller followingDo: aBlock ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> followingSiblings [

	| followingSiblings |
	followingSiblings := OrderedCollection new.
	self followingSiblingsDo: [ :call | followingSiblings add: call ].
	^ followingSiblings
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> followingSiblingsDo: aBlock [

	| sibling |
	sibling := self.
	[ (sibling := sibling nextSibling) isNotNil ] whileTrue: [
		aBlock value: sibling ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> mooseNameOn: aStream [

	self receiver ifNotNil: [ :receiver |
		receiver mooseNameOn: aStream.
		aStream nextPut: $. ].
	self method
		ifNotNil: [ :method | aStream nextPutAll: method name ]
		ifNil: [ aStream nextPutAll: '<unknownMethod>' ].
	aStream nextPut: $(.
	self arguments
		do: [ :argument | argument mooseNameOn: aStream ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $).
	self result ifNotNil: [ :result |
		aStream nextPutAll: '->'.
		result mooseNameOn: aStream ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> preceding [

	| preceding |
	preceding := OrderedCollection new.
	self precedingDo: [ :call | preceding add: call ].
	^ preceding
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> precedingDo: aBlock [

	previousSibling ifNotNil: [
		previousSibling privatePrecedingDo: aBlock ].
	caller ifNotNil: [ caller precedingDo: aBlock ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> precedingSiblings [

	| precedingSiblings |
	precedingSiblings := OrderedCollection new.
	self precedingSiblingsDo: [ :call | precedingSiblings add: call ].
	^ precedingSiblings
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> precedingSiblingsDo: aBlock [

	| sibling |
	sibling := self.
	[ (sibling := sibling previousSibling) isNotNil ] whileTrue: [
		aBlock value: sibling ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> privateFollowingDo: aBlock [

	aBlock value: self.
	self descendantsDo: aBlock.
	nextSibling ifNotNil: [ nextSibling privateFollowingDo: aBlock ]
]

{ #category : #'*Famix-ExecutionFlow-Entities-Extensions' }
FamixEFMethodCall >> privatePrecedingDo: aBlock [

	self flag: 'Optimize descendants in reverse order (oldest to newest)'.
	self descendants reverseDo: aBlock.
	aBlock value: self.
	previousSibling ifNotNil: [
		previousSibling privatePrecedingDo: aBlock ]
]
