Class {
	#name : #ProcessWrapperOpeningWindowTests,
	#superclass : #ProcessWrapperTests,
	#category : #'ProcessWrapper-Tests'
}

{ #category : #testing }
ProcessWrapperOpeningWindowTests >> testExplorer [
	"open an explorer window to the default directory"

	self should: process showWindowAtStartup.
	self should: (process startWithCommand: 'explorer .').
	self should: (process waitForExitFor: 5000).
	self shouldnt: process isRunning.
	self should: process exitCode isZero.
	
]
