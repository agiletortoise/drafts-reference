---
title: Context
category: object
---

A single global "context" object is available to scripts to control flow of the currently running action.

It is important to understand that `cancel()` and `fail()` will not immediately stop script, just stop any further action steps from being performed.

### Instance Properties

- **callbackResponses** *[array of objects]*
  - If [Callback URL]() or [Run Workflow]() action steps using the "Wait for response" option have been run in steps before the script step in an action, and the target app returned to Drafts using an x-success callback, this object will contain an array of objects with the parsed query parameters included in those responses, in the order they were received.

### Instance Functions

- **cancel(message)**
  - Tell the context to cancel the action at the end of the script execution. If called, at the end of the script the action will be stopped. No subsequent action steps in the action will run, and the action still stop silently - no notification banners, sounds, etc.  If a message is included it will be added to the action log to explain the cancellation.
- **fail(message)**
  - Tell the context to fail the current action. In effect this is the same as "cancel()" but an error notification will be shown. If a message is included it will be added to the action log to explain the cancellation.

### Examples

```javascript
// test for logical condition before continuing
if (!validationCondition) {
  context.fail();
}
// code below will still run.
```

```javascript
// if a "Run Workflow" step preceded this script, lets look for a result
var response = context.callbackResponses[0];
if (response) {
  // Workflow returns one "result" parameter, other apps may use other values.
  var result = response["result"];
  if (result) {
    // so something with the result
  }
}
```
