---
title: Templates and Tags
---

{% include back.html title="Topics" path="/topics" %}

Drafts has a lightweight template engine to allow control over how text is output in action steps. Templates are used for most values in action steps, so can be used to not only create the content of an exported file, or mail message, but to dynamically create the file name and folder, assign tags, insert timestamps and more, when an action is run.

### Content Tags

- `[[draft]]` The full text of the draft.
- `[[title]]` The first line of the draft only.
- `[[safe_title]]` File name safe version of the first line with ASCII control characters and path separators that can interfere with file names removed (\/:\*?<>\|#).
- `[[body]]` The remainder of the draft text after the first line is removed.
- `[[selection]]` If text was selected within the draft before selecting an action, this tag will return only that selected text. If no text was selected, it will return the full text of the draft.
- `[[selection_only]]` Returns selected text, but unlike `[[selection]]` will not default to returning the entire draft if no selection was made - it will simply return a empty string.
- `[[tags]]` Comma-separated list of tags linked to the draft.
- `[[line|n]]` The text of a specific line number in the draft, where “n” is the line number. i.e. `[[line|1]]`, `[[line|2]]`.
- `[[line|n..n]]` In addition to specific lines, the lines tag (above) can accept ranges of lines, such as `[[line|2..5]]` for lines 2 through 5. This initial or trailing number in the range can be omitted to indicate the beginning or end, i.e. `[[line|2..]]` is line 2 through the end of the draft, `[[line|..4]]` is the first for lines of the draft. This tag also support negative indexes, which count back from the last line of the draft, e.g. `[[line|-1]]` returns the last line of the draft.
- `[[selection_start]]` The integer index of the start location of the last text selection in the draft.
- `[[selection_length]]` The number of characters in the last text selection in the draft.

### Identifier Tags

- `[[uuid]]` A unique identifier for the current draft.
- `[[draft_open_url]]` A URL which can be used as a bookmark to open Drafts and select the current draft.

### Dates and Locations

- `[[date]]` Timestamp in the format YYYY-MM-DD.
- `[[date|format]]` Timestamp, formatted based on a custom strfime format string. For example `[[date|%m-%d-%Y]]` becomes “01–02–2013”.
- `[[created|format]]` Same as “date”, but returns the timestamp for the creation of the draft, rather than the current time.
- `[[modified|format]]` Same as “date”, but returns the timestamp for the last modification date of the draft content, rather than the current time.
- `[[longitude]]` The current device location longitude.
- `[[latitude]]` The current device location latitude.
- `[[created_longitude]]` The location longitude where the draft was created.
- `[[created_latitude]]` The location latitude where the draft was created.
- `[[modified_longitude]]` The location longitude where the content of the draft was last modified.
- `[[modified_latitude]]` The location latitude where the content of the draft was last modified.
- `[[time]]` Timestamp in the format YYYY-MM-DD-HH-MM-SS.

### Utility Tags

- `[[template|path]]` Inserts a template store in a file in iCloud Drive/Drafts/Library/Templates. "path" should be the related path to a file which exists in that folder, for example: `[[template|my-site-template.txt]]`. File will be loaded an evaluated as if it's text was inline in the current template, allowing re-use of templates across actions.
- `[[clipboard]]` The current contents of the iOS clipboard.

### Custom Tags

In addition to the predefined tags always available, scripts in an action can create custom tags which become available to action steps run after the script in the same action. This is useful if a scripted action step processes text to create a value that then needs to be inserted in a later step that shares that text. The below example shows a simple script with creates a tag.

```javascript
let s = "My String Value";
draft.setTemplateTag("mytag", s);
// after running this script, templates later
// in the action will have available a [[mytag]] tag.
```

See {% ref Draft %} object documentation for more details.

## Other Special markup

- `{% raw %}{{ }}{% endraw %}` Wrap text in double-curly brackets to have the text URL encoded.
- `{% raw %}%% %%{% endraw %}` Wrap text in double percent signs to run the enclosed text through the Markdown engine and convert it to HTML.  This is useful to export Markdown to HTML, use in HTML Preview steps or other purposes.
- `<<snippet-abbreviation>>` *[iOS only]* A valid [TextExpander](https://textexpander.com) abbreviation wrapped in double brackets will be expanded at runtime.

## Escaping

If you want to use something which would otherwise be evaluated as a template tag or function but not have it evaluated in actions, it needs to be escaped by placeing a single backslash (\) character before it.  So, for example `\[[title]]` would be ignored and not replaced with the title of the draft. The escaping backslash would be removed, however.
