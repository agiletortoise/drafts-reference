---
title: Global
category: object
---

### Functions

- **alert(message)**
  - Shows a simple alert dialog containing the message.
- **require(path)**
  - Include the contents of a script loaded from iCloud Drive. The contents of the script will be evaluated as if they were inline with the current script. Useful for loading reusable libraries and utility scripts.
  - **Parameters**
    - **path** _[string, required]_: relative path to javascript file in the iCloud Drive /Drafts/Library/Scripts" folder. For example, to load the script in the file "test.js" in the "iCloud Drive/Drafts/Library/Scripts/Utilities/" folder, use the path parameter "Utilities/test.js".
- **strftime(date, format)** *-> string*
  - Format date using strftime format string. See [strftime format reference](https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/strftime.3.html) for supported format strings.
