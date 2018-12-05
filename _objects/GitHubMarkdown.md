---
title: GitHubMarkdown
category: object
---

Drafts includes Discount-based, GitHub flavored Markdown parser based on [GHMarkdownParser](https://github.com/OliverLetterer/GHMarkdownParser). For details on the meaning of the various options, refer to [Markdown documentation](https://getdrafts.com/settings/markdown).

### Instance Functions

- **render(string)** *-> string*
  - Takes Markdown string passed and processes it with GitHub Markdown parser based on the property selections on the object.

### Instance Properties

- **smartQuotesEnabled** *[boolean, default=true]*
- **noImages** *[boolean, default=true]*
- **noLinks** *[boolean, default=true]*
- **safeLinks** *[boolean, default=true]*
- **autoLinks** *[boolean, default=false]*
- **strict** *[boolean, default=false]*
- **removeHTMLTags** *[boolean, default=false]*

### Class Functions

- **create()** -> GitHubMarkdown object
  - create a new object.

### Examples

```javascript
var inputString = "# Header\n\nMy **markdown** text";
var md = GitHubMarkdown.create();

var outputString = md.render(inputString);
```
