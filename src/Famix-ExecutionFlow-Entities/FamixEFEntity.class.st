Class {
	#name : #FamixEFEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-ExecutionFlow-Entities-Entities'
}

{ #category : #meta }
FamixEFEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-ExecutionFlow-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixEFEntity class >> isAbstract [

	<generated>
	^ self == FamixEFEntity
]

{ #category : #meta }
FamixEFEntity class >> metamodel [

	<generated>
	^ FamixEFModel metamodel
]

{ #category : #testing }
FamixEFEntity >> isDirectMethodCall [

	<generated>
	^ false
]

{ #category : #testing }
FamixEFEntity >> isIndirectMethodCall [

	<generated>
	^ false
]
