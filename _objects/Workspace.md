---
title: Workspace
category: object
---

Represents a Workspace. Can be used to inquire and load workspaces and apply them using methods on the {% ref App %} object.

### Instance Properties

- **name** *[string]*
  - The name of the workspace.
- **queryString** *[string]*
  - Search string to filter results. 
- **tagFilter** *[string]*
  - Tag string like "blue, !green" using "!" to omit a tag.
- **tagFilterRequireAll** *[boolean]*
  - If true, all (AND) tags in the tag filter must match, if false match any of the tags (OR).
- **showPreview** *[boolean]*
  - Show preview of draft body in list.
- **showTags** *[boolean]*
  - Show draft tags in list.
- **showLastAction** *[boolean]*
  - Show last logged action for draft in list.
- **inboxIncludesFlagged** *[boolean]*
  - Should flagged drafts be included in inbox
- **archiveIncludesFlagged** *[boolean]*
  - Should flagged drafts be included in archive

### Instance Functions

- **update()**
  - Save changes made to the workspace to the database. This must be called to save changes.
- **setInboxSort(sortBy, sortDescending)**
  - Set sort order for inbox.
  - **Parameters**
    - **sortBy** _[string]_: Sort by. Allowed values: "created", "modified", "accessed", "name".
    - **sortDescending** _[boolean]_: If true, sort in descending order.
- **query(filter)** _-> [array of {% ref Draft %} objects]_
  - Query for a list of drafts contained in the workspace.
  - **Parameters**
    - **filter** _[string]_: Filter by one of these allowed values: "inbox", "archive", "flagged", "trash", "all".
- **setFlaggedSort(sortBy, sortDescending, sortFlaggedToTop)**
  - Set sort order for flagged.
  - **Parameters**
    - **sortBy** _[string]_: Sort by. Allowed values: "created", "modified", "accessed", "name".
    - **sortDescending** _[boolean]_: If true, sort in descending order.
    - **sortFlaggedToTop** _[boolean]_: If true, sort flagged to beginning of results. Default: false
- **setArchiveSort(sortBy, sortDescending, sortFlaggedToTop)**
  - Set sort order for archive.
  - **Parameters**
    - **sortBy** _[string]_: Sort by. Allowed values: "created", "modified", "accessed", "name".
    - **sortDescending** _[boolean]_: If true, sort in descending order.
    - **sortFlaggedToTop** _[boolean]_: If true, sort flagged to beginning of results. Default: false
- **setAllSort(sortBy, sortDescending, sortFlaggedToTop)**
  - Set sort order for "all" drafts folder.
  - **Parameters**
    - **sortBy** _[string]_: Sort by. Allowed values: "created", "modified", "accessed", "name".
    - **sortDescending** _[boolean]_: If true, sort in descending order.
    - **sortFlaggedToTop** _[boolean]_: If true, sort flagged to beginning of results. Default: false

### Class Functions

- **create()** *-> Workspace object*
  - create a new workspace object. This is an in-memory object only, unless "update()" is called to save the it.
- **getAll()** *-> [array of Workspace objects]*
  - Get list of all available workspaces.
- **find(name)** *-> Workspace*
  - Search for workspace matching the name passed and return it if found. Returns undefined if not found.

### Examples

```javascript
// find workspace and load it in drafts list
let workspace = Workspace.find("Projects");
app.applyWorkspace(workspace);
```
