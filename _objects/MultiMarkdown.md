---
title: MultiMarkdown
category: object
redirect_to:
  - http://scripting.getdrafts.com/classes/multimarkdown
---

Drafts includes a full version of the MultiMarkdown 6 engine to render Markdown text to HTML and other supported formats.  For details on the meaning of the various options, refer to [MultiMarkdown documentation](https://github.com/fletcher/MultiMarkdown-6).

### Instance Functions

- **render(string)** *-> string*
  - Takes Markdown string passed and processes it with MultiMarkdown based on the properties and format selections on the object.

### Instance Properties

- **format** *[string, default="html"]*
  Output format for MultiMarkdown. Valid values are:
  - **html**: HTML.  This is the default Markdown output.
  - **epub**: ePub
  - **latex**: LaTeX
  - **beamer**
  - **memoir**
  - **odt**: Open document format
  - **mmd**

- **markdownCompatibilityMode** *[boolean, default=false]*
- **completeDocument** *[boolean, default=false]*
- **snippetOnly** *[boolean, default=false]*
- **smartQuotesEnabled** *[boolean, default=true]*
- **footnotesEnabled** *[boolean, default=true]*
- **noLabels** *[boolean, default=true]*
- **processHTML** *[boolean, default=true]*
- **noMetadata** *[boolean, default=false]*
- **obfuscate** *[boolean, default=false]*
- **criticMarkup** *[boolean, default=false]*
- **criticMarkupAccept** *[boolean, default=false]*
- **criticMarkupReject** *[boolean, default=false]*
- **randomFootnotes** *[boolean, default=false]*
- **transclude** *[boolean, default=false]*

### Class Functions

- **create()** -> MultiMarkdown object
  - create a new object.

### Examples

```javascript
var inputString = "# Header\n\nMy **markdown** text";
var mmd = MultiMarkdown.create();

mmd.format = "odt";
mmd.criticMarkup = true;
var outputString = mmd.render(inputString);
```
