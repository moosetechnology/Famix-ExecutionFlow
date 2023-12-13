"
A call executed by a known caller, so it can be a child of a direct parent call.
"
Class {
	#name : #FamixEFDirectMethodCall,
	#superclass : #FamixEFMethodCall,
	#category : #'Famix-ExecutionFlow-Entities-Entities'
}

{ #category : #meta }
FamixEFDirectMethodCall class >> annotation [

	<FMClass: #DirectMethodCall super: #FamixEFMethodCall>
	<package: #'Famix-ExecutionFlow-Entities'>
	<generated>
	^ self
]

{ #category : #testing }
FamixEFDirectMethodCall >> isDirectMethodCall [

	<generated>
	^ true
]
