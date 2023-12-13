"
A call executed by an unknown caller, so it can be a child of an indirect parent (ancestor) call.
"
Class {
	#name : #FamixEFIndirectMethodCall,
	#superclass : #FamixEFMethodCall,
	#category : #'Famix-ExecutionFlow-Entities-Entities'
}

{ #category : #meta }
FamixEFIndirectMethodCall class >> annotation [

	<FMClass: #IndirectMethodCall super: #FamixEFMethodCall>
	<package: #'Famix-ExecutionFlow-Entities'>
	<generated>
	^ self
]

{ #category : #testing }
FamixEFIndirectMethodCall >> isIndirectMethodCall [

	<generated>
	^ true
]
