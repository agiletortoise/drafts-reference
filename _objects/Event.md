---
title: Event
category: object
---

Event object represent individual calendar events.

#### Instance Properties

- **list** *[ReminderList]*
  - The list which this task resides in.
- **title** *[string]*
  - The title of the task.
- **notes** *[string]*
  - Notes associated with the task.
- **startDate** *[date]*
  - Start date of the event.
- **endDate** *[date]*
  - End date of the event.
- **isAllDay** *[boolean]*
  - Flag for all day events.
- **location** *[string]*
  - Location of the event.
- **creationDate** *[date, readonly]*
  - Original creation date of the event.
- **lastModifiedDate** *[date, readonly]*
  - Last change to the event.
- **hasAlarms** *[boolean, readonly]*
  - Returns true if the event has any alarms.
- **alarms** *[array of Alarms]*
  - The alarms assigned to the event, if any.
- **lastError** *[string]*
  - If a function fails, this property will contain the last error as a string message, otherwise it will be undefined.

#### Instance Functions

- **update()** *-> boolean*
  - Save the event. Returns true if the event is successfully saved in Calendars.
- **addAlarm(alarm)**
  - Add an alarm object to the event. Be sure to update() to save after adding alarms.
- **removeAllAlarms()**
  - Remove any assigned alarms from the event.

#### Examples

```javascript
var calendar = Calendar.findOrCreate("Activities");
var event = calendar.createEvent();
event.title = "Dinner Party";
event.notes = "Bring side dish.";
event.startDate = Date.parse("7pm next friday");
event.endDate = Date.parse("10pm next friday");
event.isAllDay = false;
if (!event.update()) {
  console.log(event.lastError);
}
```
