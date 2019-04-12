---
title: Share
category: object
---

Methods to share via system share sheet.

### Class Functions

- **shareAsText(text)** *-> boolean*
  - Open system share sheet to share the string provided as text. Returns true if share was completed by user. False if input was invalid or user cancelled share.
  - **Parameters**
    - **text** _[string]_: The text to share.
- **shareAsURL(url)** *-> boolean*
  - Open system share sheet to share the url provided as a URL object. Returns true if share was completed by user. False if input was invalid or user cancelled share. The string provided should be a complete and valid URL.
  - **Parameters**
    - **url** _[string]_: The url to share. Should be a valid URL.
- **shareAsFile(filename, text)** *-> boolean*
  - Open system share sheet to share the content as a file, with the specified file name (with e). Returns true if share was completed by user. False if input was invalid or user cancelled share. Drafts will create a temporary file for the purposes of the share and send it to the share sheet. The temporary file will be deleted after. Useful, for example, to create a text file and share to Mail, and it will be shared as an attachment to the email.
  - **Parameters**
    - **filename** _[string]_: The name of the file to use when sharing.
    - **text** _[string]_: The content of the file to share.

### Example

```javascript
let s = "My text to share"

let didShare = Share.shareAsText(s);

let didShare = Share.shareAsURL("http://getdrafts.com/");

let didShare = Share.shareAsFile("My-File.txt", s);
```