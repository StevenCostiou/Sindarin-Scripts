Class {
	#name : 'SindarinSTONParsingCommand',
	#superclass : 'SindarinCommand',
	#instVars : [
		'targetParsingMethod'
	],
	#category : 'NewTools-Sindarin-STON',
	#package : 'NewTools-Sindarin-STON'
}

{ #category : 'initialization' }
SindarinSTONParsingCommand class >> defaultIconName [
	^#through
]

{ #category : 'default' }
SindarinSTONParsingCommand class >> defaultName [

	^ 'step to next parsing operation'
]

{ #category : 'executing' }
SindarinSTONParsingCommand >> dynamicName [

	^ targetParsingMethod
		  ifNil: [ super dynamicName ]
		  ifNotNil: [ 'Step to next ' , targetParsingMethod ]
]

{ #category : 'executing' }
SindarinSTONParsingCommand >> execute [
	self halt
]

{ #category : 'accessing' }
SindarinSTONParsingCommand >> name [

	^ self targetParsingMethod
]

{ #category : 'accessing' }
SindarinSTONParsingCommand >> targetParsingMethod [

	^ targetParsingMethod
]

{ #category : 'accessing' }
SindarinSTONParsingCommand >> targetParsingMethod: anObject [

	targetParsingMethod := anObject
]
