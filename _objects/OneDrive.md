---
title: OneDrive
category: object
redirect_to:
  - http://scripting.getdrafts.com/classes/onedrive
---

OneDrive objects can be used to work with files in a OneDrive account.

### Properties

- **lastError** *[string]*
  - If a function fails, this property will contain the last error as a string message, otherwise it will be undefined.

### Functions

- **read(path)** *-> string*
  - Reads the contents of the file at the path as a string. Returns undefined value if the file does not exist or could not be read. Paths should begin with a "/" and be relative to the root directory of your OneDrive.
- **write(path, content, overwrite)** *-> bool*
  - Write the contents of the file at the path. Returns true if successful, false if the file could not be written successfully.  This will override existing files!
  - **Parameters**
    - path *[string]*: Paths should begin with a "/" and be relative to the root directory of your Dropbox
    - content *[string]*: Text to place in the file.
    - overwrite *[boolean]*: If false, an existing file will not be overwritten.

### Class Functions

- **create(identifier)** *-> OneDrive*
  - Creates a new OneDrive object. 
  - **Parameters**
    - **identifier** _[string]_: Optional identifier for Gmail account to use. This string is an arbitrary value, but we recommend using the email address you wish to associate with the script. Each unique identifier will be associated with its own [Credential](https://getdrafts.com/settings/credentials).

### Examples

```javascript
// create OneDrive object
var drive = OneDrive.create();

// setup variables
var path = "/test/file.txt";
var content = "text to place in file";

// write to file on OneDrive
var success = drive.write(path, content, false);

if (success) { // write worked!
  var driveContent = drive.read(path);
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
