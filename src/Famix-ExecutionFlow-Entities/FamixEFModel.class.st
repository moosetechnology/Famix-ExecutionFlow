Class {
	#name : #FamixEFModel,
	#superclass : #MooseModel,
	#traits : 'FamixEFTEntityCreator + FamixValueTEntityCreator',
	#classTraits : 'FamixEFTEntityCreator classTrait + FamixValueTEntityCreator classTrait',
	#category : #'Famix-ExecutionFlow-Entities-Model'
}

{ #category : #accessing }
FamixEFModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Value-Entities' #'Famix-Traits')
]

{ #category : #meta }
FamixEFModel class >> annotation [
	<FMClass: #FamixEFModel super: #MooseModel>
	<package: #'Famix-ExecutionFlow-Entities'>
	<generated>
]
