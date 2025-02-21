rfc2445-rules
everyDayInJanuaryFor3Years
	"The RFC 2445 example appears to be wrong.
	See: http://www.imc.org/ietf-calendar/mail-archive/msg01848.html
	
	Example:
		FREQ=YEARLY;UNTIL=20000131T090000Z;BYMONTH=1;BYDAY=SU,MO,TU,WE,TH,FR,SA
	The UNTIL value must be adjusted by the timezone offset.
	"
	| untilValue |
	untilValue := (DateAndTime year: 2000 month: 1 day: 31 hour: 9 minute: 0 second: 0) asUTC.
	event
		start:
			(self dateAndTimeClass
				year: 1998
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;UNTIL=', '', untilValue asICalUtcString, ';BYMONTH=1;BYDAY=SU,MO,TU,WE,TH,FR,SA'
