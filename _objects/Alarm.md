---
title: Alarm
category: object
---

Alarms are alerts which can be attached to Reminder and Event objects.

#### Class Functions

- **alarmWithDate(date)** *-> Alarm*
  - Alarm set to remind at a specific date/time.
- **alarmWithOffset(seconds)** *-> Alarm*
  - Alarm set to remind at a specific number of seconds relative to the start date of the event. *Note that alarms created with this methods are only supported on calendar events, not reminders.*

#### Examples

```javascript
var list = ReminderList.findOrCreate("Errands");
var reminder = list.createReminder();
reminder.title = "Get more paper towels";

var alarm = Alarm.alarmWithDate((3).days().fromNow());
reminder.addAlarm(alarm);

reminder.update();
```
