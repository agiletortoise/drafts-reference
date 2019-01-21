---
title: Console
category: object
---

For consistency with other Javascript environments, Drafts implements the "console.log" method to output to a log.

In the case of Drafts, that log is the action logging mechanism. Calls to console.log() will appear in the draft's action log, available in the (i) draft detail screen for the draft.  If you are testing script actions and using console.log, be sure the action is set to Log Level "Info" so that all log messages are retained.

### Global Functions

- **console.log(string)**
  - Send string to action log for the current draft.
