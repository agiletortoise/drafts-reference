---
title: Action
category: object
---

In addition to being able to lookup an action using the find method, a single global `action` object is created and available in scripts to inquire about the current action and control flow.

### Instance Properties

- **name** *[name, readonly]*
  - The name of the action.

### Class Functions

- **find(name)** *-> Action*
  - Search for action matching the name passed and return it if found. Returns undefined if not found.

### Examples

```javascript
// find action
var action = Action.find("Copy");
app.queueAction(action, draft);
```
