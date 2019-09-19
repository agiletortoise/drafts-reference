---
title: ActionGroup
category: object
redirect_to:
  - http://scripting.getdrafts.com/classes/actiongroup
---

Represents an action group. Can be used to inquire and load action groups in the action list and extended keyboard using methods on the {% ref App %} object.

### Instance Properties

- **name** *[name, readonly]*
  - The name of the action group.

### Class Functions

- **getAll()** *-> [array of ActionGroup objects]*
  - Get list of all available action groups.
- **find(name)** *-> ActionGroup*
  - Search for action group matching the name passed and return it if found. Returns undefined if not found.

### Examples

```javascript
// find action
var group = ActionGroup.find("Basic");
app.loadActionGroup(group);
```
