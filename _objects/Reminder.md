---
title: Reminder
category: object
---

Reminder objects represent individual tasks in a list in the built-in Reminders app.

#### Properties

- **list** *[ReminderList]*
  - The list which this task resides in.
- **title** *[string]*
  - The title of the task.
- **notes** *[string]*
  - Notes associated with the task.
- **dueDate** *[date]*
  - Optional due date.
- **priority** *[number]*
  - Integer number representing priority. Assign values matching those Apple uses as follows:
    - 0: No priority
    - 1: High
    - 5: Medium
    - 9: Low
- **isCompleted** *[boolean]*
  - Flag indicating if the task has been completed.
- **hasAlarms** *[boolean, readonly]*
  - Returns true if the reminder has any alarms.
- **alarms** *[array of Alarms]*
  - The alarms assigned to the reminder, if any.

#### Functions

- **update()** *-> boolean*
  - Save the task. Returns true if the task is successfully saved in Reminders.
- **addAlarm(alarm)** *-> boolean*
  - Add an alarm object to the reminder. Be sure to update() to save after adding alarms. Return true if the alarm was successfully added.
- **removeAllAlarms()**
  - Remove any assigned alarms from the reminder.

#### Examples

```javascript
var list = ReminderList.findOrCreate("Groceries");
var reminder = list.createReminder();
reminder.title = "Bananas";
reminder.notes = "Get slightly green ones."
reminder.update();
```
