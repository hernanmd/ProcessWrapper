Class {
	#name : #PWOutputStream,
	#superclass : #Object,
	#instVars : [
		'processWrapper',
		'readerSelector',
		'semaphoreSetterSelector',
		'semaphore',
		'dataStream',
		'atEnd',
		'binary'
	],
	#category : #'ProcessWrapper-Core'
}

{ #category : #'as yet unclassified' }
PWOutputStream class >> new [

	self error: 'Instances of ', self name, ' should be created with #on:with:with:'
]

{ #category : #'as yet unclassified' }
PWOutputStream class >> on: aProcessWrapper with: readerSelector with: semaphoreSetterSelector [

	^self basicNew
		processWrapper: aProcessWrapper;
		readerSelector: readerSelector;
		semaphoreSetterSelector: semaphoreSetterSelector;
		initialize;
		yourself
]

{ #category : #'private - finalization' }
PWOutputStream >> actAsExecutor [

	super actAsExecutor.
	processWrapper := nil. "drop the reference so it can be garbage collected"
	


	
	
	
]

{ #category : #public }
PWOutputStream >> ascii [

	binary := false
]

{ #category : #public }
PWOutputStream >> atEnd [

	atEnd ifFalse: [
		dataStream atEnd ifTrue: [ self fetchDataBlock ] ].
	^atEnd
	
]

{ #category : #public }
PWOutputStream >> binary [

	binary := true
]

{ #category : #private }
PWOutputStream >> fetchDataBlock [

	| buffer bytesRead |
	buffer := self newBuffer: 4096.
	[ semaphore wait.
 	bytesRead := processWrapper perform: readerSelector with: buffer.
	bytesRead isZero ] whileTrue.
	bytesRead > buffer size ifTrue: [
		atEnd := true. ^self ].
	dataStream := ReadStream on: (buffer first: bytesRead)
	
]

{ #category : #'private - finalization' }
PWOutputStream >> finalize [

	Smalltalk unregisterExternalObject: semaphore.


	
	
	
]

{ #category : #private }
PWOutputStream >> initialize [

	| semaphoreIndex |
	atEnd := false.
	binary := false.
	semaphore := Semaphore new.
	dataStream := ReadStream on: (self newBuffer: 0).
	semaphoreIndex := Smalltalk registerExternalObject: semaphore.
	processWrapper perform: semaphoreSetterSelector with: semaphoreIndex.
	processWrapper class registerForFinalization: self


	
	
	
]

{ #category : #private }
PWOutputStream >> newBuffer: size [

	^binary 
		ifTrue: [ ByteArray new: size ]
		ifFalse: [ String new: size ]
]

{ #category : #public }
PWOutputStream >> next [

	self atEnd ifTrue: [ ^nil ].
	^dataStream next
	
]

{ #category : #public }
PWOutputStream >> next: anInteger [

	| result index nextValue |
	result := self newBuffer: anInteger.
	index := 1.
	[ index <= anInteger and: [ (nextValue := self next) notNil ] ] whileTrue: [
		result at: index put: nextValue.
		index := index + 1 ].
	index <= anInteger ifTrue: [ ^result first: index ].
	^result
	
]

{ #category : #private }
PWOutputStream >> processWrapper: aProcessWrapper [

	processWrapper := aProcessWrapper
]

{ #category : #private }
PWOutputStream >> readerSelector: aSelector [

	readerSelector := aSelector
]

{ #category : #private }
PWOutputStream >> semaphoreSetterSelector: aSelector [

	semaphoreSetterSelector := aSelector
]

{ #category : #public }
PWOutputStream >> upToEnd [

	| result nextValue |
	result := WriteStream on: (self newBuffer: 4096).
	[ (nextValue := self next) notNil ] 
		whileTrue: [ result nextPut: nextValue ].
	^result contents
	
]
