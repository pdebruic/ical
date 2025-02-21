testing
testParseTime
	| time string |
	time := self timeClass hour: 10 minute: 22 second: 00.
	self assert: '10:22:00'  equals: time asVCardString.
	
	string := '10:22:00'.
	time := self timeClass hour: 10 minute: 22 second: 00.
	self assert: (self timeClass fromVCardString: string) equals: time.
	
	string := '102200'.
	time := self timeClass hour: 10 minute: 22 second: 00.
	self assert: (self timeClass fromVCardString: string)  equals: time.
	
	string := '10:22:00.33'.
	time := self timeClass hour: 10 minute: 22 second: 00 nanosecond: 330000000.
	self assert: (self timeClass fromVCardString: string) equals: time.
	self assert: time asVCardString equals: string.
	
	string := '10:22:00.33Z'.
	time := self timeClass hour: 10 minute: 22 second: 00 nanosecond: 330000000.
	self assert: (self timeClass fromVCardString: string)  equals: time.
	self assert: time asVCardUtcString = string.
	
	string := '10:22:00-08:00'.
	time := self timeClass hour: 10 minute: 22 second: 00.
	self assert: (self timeClass fromVCardString: string)  equals: time.