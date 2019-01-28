"
To run these tests you'll need the unixutils suit from: http://unxutils.sourceforge.net/
The exe files (cat.exe touch.exe) have to be on the path of the vm's process.
"
Class {
	#name : #ProcessWrapperUnixUtilsTests,
	#superclass : #ProcessWrapperTests,
	#category : #'ProcessWrapper-Tests'
}

{ #category : #testing }
ProcessWrapperUnixUtilsTests >> testCat [

	process useStdout.
	self should: (process startWithCommand: 'cat').
	self should: (process isRunning).
	self shouldnt: (process waitForExitFor: 5000).
	self should: (process writeToStdin: 'bla').
	self should: process isRunning.
	self should: ((process next: 3) = 'bla').
	self should: (process closeStdin).
	self should: (process waitForExitFor: 5000).
	self shouldnt: process isRunning.
	self should: process exitCode isZero.
	
]

{ #category : #testing }
ProcessWrapperUnixUtilsTests >> testTouch [

	| file |
	file := self newFileName.
	self should: (process startWithCommand: 'touch ', file).
	self should: (process waitForExitFor: 5000).
	self shouldnt: process isRunning.
	self should: process exitCode isZero.
	self should: file asFileReference exists.
	
]
