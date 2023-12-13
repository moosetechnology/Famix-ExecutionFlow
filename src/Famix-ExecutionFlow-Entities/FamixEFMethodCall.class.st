"
Represents a method call in the context of a dynamic call graph.
This entity links a method from a Famix model to actual runtime values, capturing the details of the dynamic call during program execution.
"
Class {
	#name : #FamixEFMethodCall,
	#superclass : #FamixEFEntity,
	#instVars : [
		'#duration => FMProperty',
		'#timestamp => FMProperty',
		'#numberOfCalls => FMProperty defaultValue: 1',
		'#nextSibling => FMOne type: #FamixEFMethodCall opposite: #previousSibling',
		'#previousSibling => FMOne type: #FamixEFMethodCall opposite: #nextSibling',
		'#caller => FMOne type: #FamixEFMethodCall opposite: #calls',
		'#calls => FMMany type: #FamixEFMethodCall opposite: #caller'
	],
	#category : #'Famix-ExecutionFlow-Entities-Entities'
}

{ #category : #meta }
FamixEFMethodCall class >> annotation [

	<FMClass: #MethodCall super: #FamixEFEntity>
	<package: #'Famix-ExecutionFlow-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixEFMethodCall class >> isAbstract [

	<generated>
	^ self == FamixEFMethodCall
]

{ #category : #adding }
FamixEFMethodCall >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : #adding }
FamixEFMethodCall >> addCall: anObject [
	<generated>
	^ self calls add: anObject
]

{ #category : #accessing }
FamixEFMethodCall >> arguments [
	"Relation named: #arguments type: #FamixValueOfType opposite: #argumentInMethodCall"

	<generated>
	<FMComment: 'The arguments of the call.'>
	<derived>
	<FMProperty: #arguments type: #FamixValueOfType opposite: #argumentInMethodCall>
	^ self attributeAt: #arguments ifAbsentPut: [ FMMultivalueLink on: self opposite: #argumentInMethodCall: ]
]

{ #category : #accessing }
FamixEFMethodCall >> arguments: anObject [

	<generated>
	self arguments value: anObject
]

{ #category : #accessing }
FamixEFMethodCall >> caller [
	"Relation named: #caller type: #FamixEFMethodCall opposite: #calls"

	<generated>
	<FMComment: 'The calling method.'>
	^ caller
]

{ #category : #accessing }
FamixEFMethodCall >> caller: anObject [

	<generated>
	caller := anObject
]

{ #category : #accessing }
FamixEFMethodCall >> calls [
	"Relation named: #calls type: #FamixEFMethodCall opposite: #caller"

	<generated>
	<FMComment: 'Methods called by me.'>
	<derived>
	^ calls
]

{ #category : #accessing }
FamixEFMethodCall >> calls: anObject [

	<generated>
	calls value: anObject
]

{ #category : #accessing }
FamixEFMethodCall >> duration [

	<FMProperty: #duration type: #Object>
	<generated>
	<FMComment: 'Duration of the method call.'>
	^ duration
]

{ #category : #accessing }
FamixEFMethodCall >> duration: anObject [
	<generated>
	duration := anObject
]

{ #category : #accessing }
FamixEFMethodCall >> method [
	"Relation named: #method type: #FamixTMethod opposite: #methodCalls"

	<generated>
	<FMComment: 'The called method.'>
	<FMProperty: #method type: #FamixTMethod opposite: #methodCalls>
	^ self attributeAt: #method ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixEFMethodCall >> method: anObject [

	<generated>
	self attributeAt: #method put: (FMMultivalueLink on: self update: #methodCalls from: self method to: anObject).
]

{ #category : #accessing }
FamixEFMethodCall >> nextSibling [
	"Relation named: #nextSibling type: #FamixEFMethodCall opposite: #previousSibling"

	<generated>
	<FMComment: 'The next sibling/call in the same method context.'>
	^ nextSibling
]

{ #category : #accessing }
FamixEFMethodCall >> nextSibling: anObject [

	<generated>
	nextSibling := anObject
]

{ #category : #accessing }
FamixEFMethodCall >> numberOfCalls [

	<FMProperty: #numberOfCalls type: #Number defaultValue: 1>
	<generated>
	<FMComment: 'The number of times this path was taken.'>
	^ numberOfCalls ifNil: [ numberOfCalls := 1 ]
]

{ #category : #accessing }
FamixEFMethodCall >> numberOfCalls: anObject [
	<generated>
	numberOfCalls := anObject
]

{ #category : #accessing }
FamixEFMethodCall >> previousSibling [
	"Relation named: #previousSibling type: #FamixEFMethodCall opposite: #nextSibling"

	<generated>
	<FMComment: 'The previous sibling/call in the same method context.'>
	<derived>
	^ previousSibling
]

{ #category : #accessing }
FamixEFMethodCall >> previousSibling: anObject [

	<generated>
	previousSibling := anObject
]

{ #category : #accessing }
FamixEFMethodCall >> receiver [
	"Relation named: #receiver type: #FamixValueOfType opposite: #receiverInMethodCall"

	<generated>
	<FMComment: 'The receiver of the call.'>
	<FMProperty: #receiver type: #FamixValueOfType opposite: #receiverInMethodCall>
	^ self attributeAt: #receiver ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixEFMethodCall >> receiver: anObject [

	<generated>
	self attributeAt: #receiver put: (FMMultivalueLink on: self update: #receiverInMethodCall from: self receiver to: anObject).
]

{ #category : #accessing }
FamixEFMethodCall >> result [
	"Relation named: #result type: #FamixValueOfType opposite: #resultInMethodCall"

	<generated>
	<FMComment: 'The result of the call.'>
	<FMProperty: #result type: #FamixValueOfType opposite: #resultInMethodCall>
	^ self attributeAt: #result ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixEFMethodCall >> result: anObject [

	<generated>
	self attributeAt: #result put: (FMMultivalueLink on: self update: #resultInMethodCall from: self result to: anObject).
]

{ #category : #accessing }
FamixEFMethodCall >> timestamp [

	<FMProperty: #timestamp type: #Object>
	<generated>
	<FMComment: 'Date and time of the start of the method call.'>
	^ timestamp
]

{ #category : #accessing }
FamixEFMethodCall >> timestamp: anObject [
	<generated>
	timestamp := anObject
]
