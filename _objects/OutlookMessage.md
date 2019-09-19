---
title: OutlookMessage
category: object
redirect_to:
  - http://scripting.getdrafts.com/classes/outlookmessage
---

The OutlookMessage object can be used to create and send mail messages through Outlook.com integrated accounts, similar to those created by a [Outlook action step](https://getdrafts.com/actions/steps/outlook). Creating and sending these messages happens in the background, with no user interface, so messages must be complete with recipients before calling `send()`. Sending is done via the [Microsoft Graph API](https://developer.microsoft.com/en-us/graph). Outlooks accounts are authenticated when used for the first time using OAuth - to use more than one account, call create with different identifier parameters.

### Instance Properties

- **toRecipients** *[array of strings]*
  - Array of email addresses to use as "To:" recipients. Each entry can be a valid email address, or a name and email in the format `Name<email>`.
- **ccRecipients** *[array of strings]*
  - Array of email addresses to use as "CC:" recipients. Each entry can be a valid email address, or a name and email in the format `Name<email>`.
- **bccRecipients** *[array of strings]*
  - Array of email addresses to use as "BCC:" recipients. Each entry can be a valid email address, or a name and email in the format `Name<email>`.
- **subject** *[string]*
  - Subject line
- **body** *[string]*
  - Body text of the mail message.  Can be plain text or HTML if the "isBodyHTML" property is set to true.
- **isBodyHTML** *[boolean]*
  - true/false flag indicating whether to treat the body string and plain text or HTML. When set to true, the "body" property should be set to full valid HTML.

### Functions

- **send()** *-> boolean*
  - Send the mail message via the Microsoft Graph API.

### Class Functions

- **create(identifier)** -> OutlookMessage object
  - create a new object.
  - **Parameters**
    - **identifier** _[string]_: Optional identifier for Outlook account to use. This string is an arbitrary value, but we recommend using the email address you wish to associate with the script. Each unique identifier will be associated with its own [Credential](https://getdrafts.com/settings/credentials).

### Examples

```javascript
let message = OutlookMessage.create();
message.toRecipients = ["joe@sample.com", "Jim Test <jim@test.com>"];
message.subject = "My test message";
message.body = "Body text";

var success = message.send();
if (!success) {
  console.log("Sending outlook message failed");
  context.fail();
}
```
