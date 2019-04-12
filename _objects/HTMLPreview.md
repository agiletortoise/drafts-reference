---
title: HTMLPreview
category: object
---

Display of HTML Preview window, the same as the HTMLPreview action step.

### Functions

- **show(html)** *-> boolean*
  - Open HTML Preview window displaying the HTML string passed.
  - **Parameters**
    - **html** _[string]_: The HTML content to display. Should be complete HTML document.
  - **Returns**
    - *boolean*: Returns true if user closed preview with the "Continue" button, false if the user cancelled.

### Class Functions

- **create()** *-> HTMLPreview*
  - Create new HTMLPreview object.

### Example

```javascript
let html = "<html><body>My Document</body></html>"

let preview = HTMLPreview.create();
preview.show(html);
```