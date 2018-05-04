---
title: Dropbox
category: object
---

Dropbox objects can be used to work with files in a Dropbox account.

### Properties

- **lastError** *[string]*
  - If a function fails, this property will contain the last error as a string message, otherwise it will be undefined.

### Functions

- **read(path)** *-> string*
  - Reads the contents of the file at the path as a string. Returns undefined value if the file does not exist or could not be read. Paths should begin with a "/" and be relative to the root directory of your Dropbox.
- **write(path, content, mode, autorename)** *-> bool*
  - Write the contents of the file at the path. Returns true if successful, false if the file could not be written successfully.  This will override existing files!
  - **Parameters**
    - path *[string]* Paths should begin with a "/" and be relative to the root directory of your Dropbox
    - content *[string]*
    - mode *[string]*: Either "add" or "overwrite" to determine if the write method should overwrite an existing file at the path if it exists.
    - autorename *[boolean]*

### Class Functions

- **create(identifier)** *-> Dropbox*
  - Creates a new Dropbox object. Identifier is a optional string value used to identify a Dropbox account.  Typically this can be omitted if you only work with one Dropbox account in Drafts.

### Examples

```javascript
// create Dropbox object
var db = Dropbox.create();

// setup variables
var path = "/test/file.txt";
var content = "text to place in file";

// write to file on Dropbox
var success = db.write(path, content, "add", true);

if (success) { // write worked!
  var dbContent = db.read(path);
  if (dbContent) { // read worked!
    if (dbContent == content) {
      alert("File contents match!");
    }
    else {
      console.log("File did not match");
      context.fail();
    }
  }
  else { // read failed, log error
    console.log(db.lastError);
    context.fail();
  }
}
else { // write failed, log error
  console.log(db.lastError);
  context.fail();
}
```
