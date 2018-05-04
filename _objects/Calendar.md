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
  - Save changes to the list.
- **createEvent()** *-> Event*
  - Create a new Event object in this calendar.

#### Class Functions

- **findOrCreate(title)** *-> Reminder*
  - Searches for a calendar matching the title.  If none is found, creates a new list with that title in your default calendars account.  If more than one calendar with the same name exist in Calendars, the first found will be returned.

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
