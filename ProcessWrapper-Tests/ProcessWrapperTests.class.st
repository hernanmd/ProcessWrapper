Class {
	#name : #ProcessWrapperTests,
	#superclass : #TestCase,
	#instVars : [
		'process',
		'fileNames'
	],
	#category : #'ProcessWrapper-Tests'
}

{ #category : #accessing }
ProcessWrapperTests >> newFileName [

	| fileName |
	fileName := 'testFile', UUID new asString36, '.txt'.
	fileNames add: fileName.
	^fileName
]

{ #category : #accessing }
ProcessWrapperTests >> setUp [

	process := ProcessWrapper new.
	fileNames := Set new
]

{ #category : #accessing }
ProcessWrapperTests >> tearDown [

	process isRunning ifTrue: [ process terminate ].
	process := nil. "Release the ProcessWrappers for successful plugin unloading"
	fileNames do: [ : each | each asFileReference ensureDelete ]
	
]
