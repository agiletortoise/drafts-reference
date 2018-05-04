---
title: Calendar
category: object
---

Calendar objects are used to manipulate and create calendars in the built-in Calendars app and its associated accounts.

#### Properties

- **title** *[string]*
  - The name of the list.

#### Instance Functions

- **update()** *-> boolean*
  - Save changes to the calendar.
- **createEvent()** *-> Event*
  - Create a new Event object in this calendar.
- **events(startDate, endDate)** *-> [array of [Events](/objects/event)]*
  - Returns array of events on the calendar between the start and end dates specified.

#### Class Functions

- **findOrCreate(title)** *-> Calender*
  - Searches for a calendar matching the title.  If none is found, creates a new list with that title in your default calendars account.  If more than one calendar with the same name exist in Calendars, the first found will be returned.

#### Class Properties

- **default** *[Calender]*
  - Returns the system default calendar configured for new events.

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
