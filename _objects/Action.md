---
title: Action
category: object
---

A single global "action" object is created and available in the scripts to inquire about the current action and control flow.

### Instance Properties

- **name** *[name, readonly]*
  - The name of the action currently being executed.

### Class Functions

- **find(name)** *-> Action*
  - Search for action matching the name passed and return it if found. Returns undefined if not found.

### Examples

```javascript
// find action
var action = Action.find("Copy");
```
