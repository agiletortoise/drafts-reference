---
title: FileManager
category: object
---

FileManager objects can be used to read from or write to files in either the local Drafts app Documents directory (as visible in the Files.app), or iCloud Drive (inside the "Drafts5" folder).

### Properties

- **lastError** *[string]*
  - If a function fails, this property will contain the last error as a string message, otherwise it will be undefined.

### Instance Functions

- **createLocal()** *-> FileManager*
  - Convenience method to create local file manager.
- **createCloud()** *-> FileManager*
  - Convenience method to create iCloud file manager.
- **readString(path)** *-> string*
  - Reads the contents of the file at the path. Returns undefined value if the file does not exist or could not be read. Paths should begin with a "/" and be relative to the root directory of the FileManager.
- **writeString(path, content)** *-> boolean*
  - Write the contents of the file at the path. Returns true if successful, false if the file could not be written successfully.  This will override existing files!
- **listContents(path)** *-> [array of paths]*
  - List files and directories at the specified path. Array of full path will be returned.
- **createDirectory(name, path)** *-> boolean*
  - Create a directory with the specified name in the specified path. Returns true if directory successfully created.
- **moveItem(fromPath, toPath, overwrite)** *-> boolean*
  - Move file or directory at `fromPath` to the `toPath`. From and to path should be complete paths with file names included.
  - **Parameters:**
    - *fromPath* [string, required]
    - *toPath* [string, required]
    - *overwrite* [boolean, default: false]: If true, replace existing files in at the `toPath`. If false, abort operation if file exists at destination.
- **copyItem(fromPath, toPath, overwrite)** *-> boolean*
  - Copy file or directory at `fromPath` to the `toPath`. From and to path should be complete paths with file names included.
  - **Parameters:**
    - *fromPath* [string, required]
    - *toPath* [string, required]
    - *overwrite* [boolean, default: false]: If true, replace existing files in at the `toPath`. If false, abort operation if file exists at destination.

### Class Functions

- **create(isLocal)** *-> FileManager*
  - Creates a new FileManager object. If "isLocal" is true, the FileManager will be using the to the local Drafts app documents directory as its root directory, as it appears in the "On my ..." area in the Files.app.  If "isLocal" is false, it will use the Drafts5 iCloud folder as its root directory.

### Examples

```javascript
// create a local file in App documents
let fmLocal = FileManager.createLocal(); // Local file in app container
let success = fmLocal.writeString("/ScriptedFile.txt", "This is the file content");

// read from file in iCloud
let fmCloud = FileManager.createCloud(); // iCloud
let content = fmCloud.readString("/Test Folder/Test.txt")

// create a directory, and move a file to it
fmCloud.createDirectory("My Folder", "/");
fmCloud.moveItem("/TestFile.txt", "/My Folder/TestFile.txt", false);
```
