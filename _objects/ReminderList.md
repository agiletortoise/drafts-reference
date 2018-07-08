---
title: ReminderList
category: object
---

ReminderList objects are used to manipulate and create lists in the built-in Reminders app.

#### Properties

- **title** *[string]*
  - The name of the list.
- **tasks** *[array of Reminders, readonly]*
  - All reminders in the list.
- **incompleteTasks** *[array of Reminders, readonly]*
  - Reminders in the list which are NOT completed.
- **completeTasks** *[array of Reminders, readonly]*
  - Reminders in the list which have been marked completed.

#### Instance Functions

- **update()** *-> boolean*
  - Save changes to the list.
- **createReminder()** *-> Reminder*
  - Create a new Reminder object in this list.

#### Class Functions

- **findOrCreate(title)** *-> ReminderList*
  - Searches for a list in the reminders app matching the title.  If none is found, creates a new list with that title.  If more than one list with the same name exist in Reminders, the first found will be returned.
- **find(title)** *-> ReminderList*
  - Searches for a reminder lists matching the title.  If none is found, return `undefined`.
- **getAllCalendars()** *-> [ReminderList]*
  - Get an array all known reminder lists on the device.
- **default()** *ReminderList*
  - Returns the system default reminder list configured for new reminders.

#### Examples

```javascript
var list = ReminderList.findOrCreate("Groceries");
var reminder = list.createReminder();
reminder.title = "Bananas";
reminder.notes = "Get slightly green ones."
reminder.update();
```
