"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FamixEFTEntityCreator,
	#category : #'Famix-ExecutionFlow-Entities-Model'
}

{ #category : #meta }
FamixEFTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-ExecutionFlow-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixEFTEntityCreator >> newDirectMethodCall [

	<generated>
	^ self add: FamixEFDirectMethodCall new
]

{ #category : #'entity creation' }
FamixEFTEntityCreator >> newIndirectMethodCall [

	<generated>
	^ self add: FamixEFIndirectMethodCall new
]
