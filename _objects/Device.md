---
title: Device
category: object
---

Drafts defines a single global "device" object which provides access to information about the current device.

#### Instance Properties

- **model** *[string]*
	- Model of current device. For example, "iPhone", "iPad".
- **systemName** *[string]*
  - Name of current OS. Example: "iOS"
- **systemVersion** *[string]*
  - Version of current OS. Example: "11.2"
- **batteryLevel** *[number]*
  - Current battery level as a number between 0.0 and 1.0

#### Examples

```javascript
// get system info from device object
var model = device.model;
var system = device.systemName;
var osVersion = device.systemVersion;
var batteryLevel = device.batteryLevel;

// create and display it in an alert
var s = "Model: " + model + "\n";
s = s + "System: " + system + "\n";
s = s + "OS: " + osVersion + "\n";
s = s + "Battery: " + batteryLevel;
alert(s);
```
