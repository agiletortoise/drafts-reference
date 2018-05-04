---
title: GoogleDrive
category: object
---

GoogleDrive objects can be used to work with files in Google Drive accounts.

### Properties

- **lastError** *[string]*
  - If a function fails, this property will contain the last error as a string message, otherwise it will be undefined.

### Functions

- **read(fileName, parent)** *-> string*
  - Reads the contents of the file at the with the file name, in the parent folder, as a string. Returns undefined value if the file does not exist or could not be read.
  - **Parameters**
    - fileName *[string]*: Name of file.
    - parent *[string]*: Name of folder in the root of the Google Drive, or "" for root.
- **write(fileName, parent, content)** *-> bool*
  - Write the contents of the file at the path. Returns true if successful, false if the file could not be written successfully.  This will override existing files!
  - **Parameters**
    - fileName *[string]*: Name of file.
    - parent *[string]*: Name of folder in the root of the Google Drive, or "" for root.
    - content *[string]*: Text to write to file.

### Class Functions

- **create(identifier)** *-> GoogleDrive*
  - Creates a new GoogleDrive object. Identifier is a optional string value used to identify a GoogleDrive account.  Typically this can be omitted if you only work with one GoogleDrive account in Drafts.

### Examples

```javascript
// create GoogleDrive object
var drive = GoogleDrive.create();

// setup variables
var fileName = "MyTestFile";
var parent = ""; // root of drive
var content = "text to place in file";

// write to file on GoogleDrive
var success = drive.write(fileName, parent, content);

if (success) { // write worked!
  var driveContent = drive.read(fileName, parent);
  if (driveContent) { // read worked!
    if (driveContent == content) {
      alert("File contents match!");
    }
    else {
      console.log("File did not match");
      context.fail();
    }
  }
  else { // read failed, log error
    console.log(drive.lastError);
    context.fail();
  }
}
else { // write failed, log error
  console.log(drive.lastError);
  context.fail();
}
```
