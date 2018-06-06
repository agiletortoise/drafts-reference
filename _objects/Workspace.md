---
title: Workspace
category: object
---

Represents a Workspace. Can be used to inquire and load workspaces and apply them using methods on the {% ref App %} object.

### Instance Properties

- **name** *[name, readonly]*
  - The name of the workspace.

### Class Functions

- **getAll()** *-> [array of Workspace objects]*
  - Get list of all available workspaces.
- **find(name)** *-> ActionGroup*
  - Search for workspace matching the name passed and return it if found. Returns undefined if not found.

### Examples

```javascript
// find action
var workspace = Workspace.find("Projects");
app.applyWorkspace(workspace);
```
