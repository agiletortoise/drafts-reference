---
title: Base64
category: object
---

Helper methods to encode and decode [Base64](https://en.wikipedia.org/wiki/Base64) strings.

### Class Functions

- **encode(string)** *-> string*
  - Base64 encode a string.
- **decode(string)** *-> string*
  - Base64 decode a string.

### Examples

```javascript
 let s = "My String";
let encoded = Base64.encode(s);
let decoded = Base64.decode(encoded);
```
