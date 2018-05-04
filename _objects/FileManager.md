---
title: FileManager
category: object
---

FileManager objects can be used to read from or write to files in either the local Drafts app Documents directory (as visible in the Files.app), or iCloud Drive (inside the "Drafts5" folder).

### Instance Functions

- **createLocal()** *-> FileManager*
  - Convenience method to create local file manager.
- **createCloud()** *-> FileManager*
  - Convenience method to create iCloud file manager.
- **read(path)** *-> string*
  - Reads the contents of the file at the path. Returns undefined value if the file does not exist or could not be read. Paths should begin with a "/" and be relative to the root directory of the FileManager.
- **write(path, content)** *-> bool*
  - Write the contents of the file at the path. Returns true if successful, false if the file could not be written successfully.  This will override existing files!

### Class Functions

- **create(isLocal)** *-> FileManager*
  - Creates a new FileManager object. If "isLocal" is true, the FileManager will be using the to the local Drafts app documents directory as its root directory, as it appears in the "On my ..." area in the Files.app.  If "isLocal" is false, it will use the Drafts5 iCloud folder as its root directory.

### Examples

```javascript
// create a local file in App documents
var fmLocal = FileManager.createLocal(); // Local file in app container
var success = fmLocal.write("/ScriptedFile.txt", "This is the file content");

// read from file in iCloud
var fmCloud = FileManager.createCloud(); // iCloud
var content = fmCloud.read("/Test Folder/Test.txt")
```
