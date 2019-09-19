---
title: Version
category: object
redirect_to:
  - http://scripting.getdrafts.com/classes/version
---

The Version object represents a single version in the version history of a draft. Versions can by loaded through the `versions` property of the {% ref Draft %} object.

#### Instance Properties

- **uuid** *[string, readonly]*
  - Unique identifier for the version.
- **content** *[string, readonly]*
  - The text content of the version
- **createdAt** *[date, readonly]*
  - The timestamp of when the version was created.

### Examples

```javascript
// load versions
let versions = draft.versions

for (let v of versions) {
    console.log(v.createdAt + ": " + v.content + "\n");
}

draft.saveVersion(); // create new version
```
