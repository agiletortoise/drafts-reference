---
title: Draft
category: object
---

The Draft object represents a single draft.  When an action is run, the current draft is available as the global variable "draft".  Scripts can also create new drafts, access and set values, and update the draft to persist changes.

#### Instance Properties

- **uuid** *[string, readonly]*
  - Unique identifier for the draft.
- **content** *[string]*
  - The text content.
- **title** *[string, readonly]*
  - The title. This is generally the first line of the draft.
- **languageGrammar** *[string]*
  - The preferred language grammar (syntax) to use for the draft. Must be a recognized value, like "Plain Text", "Markdown", "Taskpaper", "JavaScript", "Simple List", exactly matching (case-sensitive) the syntax name as displayed in Drafts.
- **selectionStart** *[number, readonly]*
  - The index location in the string of the beginning of the last text selection.
- **selectionLength** *[number, readonly]*
  - The length of the last text selection.
- **tags** *[array, readonly]*
  - Array of string tag names assigned to the draft.
- **isArchived** *[boolean]*
  - True if draft is in the archive, false if it is in inbox.
- **isTrashed** *[boolean]*
  - True if draft is in the trash, false if it is not.
- **isFlagged** *[boolean]*
  - Use to access or set flagged status.
- **createdAt** *[date, readonly]*
- **createdLongitude** *[number]*
- **createdLatitude** *[number]*
- **modifiedAt** *[date, readonly]*
- **modifiedLongitude** *[number]*
- **modifiedLatitude** *[number]*
- **modifiedAt** *[date, readonly]*
- **permalink** *[string, readonly]*
  - URL which can be used to open the draft.

#### Instance Functions

- **update()**
  - save changes made to the draft to the database. _This must be called to save changes made during an action's execution._
- **addTag(tag)**
  - assign a tag.
- **removeTag(tag)**
  - remove a tag if it is assigned to the draft.
- **hasTag(tag)** *-> boolean*
  - returns boolean indicating whether the tag is currently assigned to the draft.
- **processTemplate(template)** *-> string*
  - runs the passed template string through the template engine to evaluate tags (like `[[title]]`, `[[body]]`).
- **setTemplateTag(tagName, value)**
  - set a custom tag value for use in templates. For example, calling `setTemplateTag("mytag", "mytext")` will create a tag `[[mytag]]`, which subsequent action step templates can use.
- **getTemplateTag(tagName)** *-> string*
  - get the current value of a custom template tag.

#### Class Functions

- **create()** *-> draft object*
  - create a new draft object. This is an in-memory object only, unless "update()" is called to save the draft.
- **find(uuid)** *-> draft object*
  - find an existing draft based on UUID.
- **query(queryString, filter, tags, omitTags, sort, sortDescending)** *-> [array of drafts]*
  - perform a search for drafts and return an array of matching draft objects.
  - **Parameters**
    - **queryString** _[string]_: Search string, as you would type in the search box in the draft list. Will find only drafts with a matching string in their contents. Use empty string ("") not to filter.
    - **filter** _[string]_: Filter by one of these allowed values: "inbox", "archive", "flagged", "trash", "all".
    - **tags** _[array of strings]_: Results will only include drafts with one or more of these tags assigned.
    - **omitTags** _[array of strings]_: Results will omit drafts with any of these tags assigned.
    - **sort** _[string]_: Sort by. Allowed values: "created", "modified", "accessed", "name".
    - **sortDescending** _[boolean]_: If true, sort descending. Default: false.
    - **sortFlaggedToTop** _[boolean]_: If true, sort flagged drafts to beginning. Default: false.
- **recentTags()** [array of strings]
  - Returns array of recently used tags. Helpful for building prompts to select tags.

#### Examples

```javascript
// create a new draft, assign content and save it
let d = Draft.create();
d.content = "My new draft";
d.update();

// query a list of drafts in the inbox with the tag "blue"
let drafts = Draft.query("", "inbox", ["blue"])
```
