private
timezoneWithEndDate
	| timezone standard daylight |
	timezone := ICTimezone new.
	
	timezone := ICTimezone new.
	timezone id: 'US-Eastern'.
	timezone lastModified: (self dateAndTimeClass year: 1987 month: 01 day: 01 hour: 0 minute: 0 second: 0  offset: (self durationClass seconds: 0)).
	timezone url: (ICConversion urlClass absoluteFromText: 'http://zones.stds_r_us.net/tz/US-Eastern').
	
	standard := ICStandardTime new.
	standard start: (self dateAndTimeClass year: 1967 month: 10 day: 29 hour: 02 minute: 00 second: 00).
	standard addRecurrenceRule: (ICRecurrenceRule yearly
		addWeekday: 'SU' occurrence: -1;
		addMonthnumber: 10;
		yourself).
	standard offsetFrom: (ICUtcOffset new positive: false; hours: 4; yourself).
	standard offsetTo: (ICUtcOffset new positive: false; hours: 5; yourself).
	standard addName: 'EST'.
	timezone addStandardTime: standard.
	
	daylight := ICDaylightSavingTime new.
	daylight start: (self dateAndTimeClass year: 1987 month: 04 day: 05 hour: 02 minute: 00 second: 00).
	daylight addRecurrenceRule: (ICRecurrenceRule yearly
		addWeekday: 'SU' occurrence: 1;
		addMonthnumber: 4;
		yourself).
	daylight offsetFrom: (ICUtcOffset new positive: false; hours: 5; yourself).
	daylight offsetTo: (ICUtcOffset new positive: false; hours: 4; yourself).
	daylight addName: 'EDT'.
	timezone addDaylightSavingTime: daylight.
	
	^timezone