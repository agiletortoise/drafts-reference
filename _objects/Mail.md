---
title: Mail
category: object
---

The Mail object can be used to create and send mail messages, similar to those created by a "Mail" action step.

### Instance Properties

- **toRecipients** *[array]*
  - Array of email addresses to use as "To:" recipients.
- **ccRecipients** *[array]*
  - Array of email addresses to use as "CC:" recipients.
- **bccRecipients** *[array]*
  - Array of email addresses to use as "BCC:" recipients.
- **subject** *[string]*
  - Subject line
- **body** *[string]*
  - Body text of the mail message.  Can be plain text or HTML if the "isBodyHTML" property is set to true.
- **isBodyHTML** *[boolean]*
  - true/false flag indicating whether to treat the body string and plain text or HTML. When set to true, the "body" property should be set to full valid HTML.
- **sendInBackground** *[boolean]*
  - true/false, default false. If true, the mail will be sent in the background using a web service rather than via Mail.app - but will come "From: drafts5@drafts5.agiletortoise.com".
- **isSent** *[boolean]*
  - true/false flag indicated if the message object has already been sent.
- **status** *[string]*
  - Contains one of the following status strings:
    - *created*: Initial value before "send()" has been called.
    - *sent*: The message was sent successfully.
    - *savedAsDraft*: On iOS, the user exited the Mail.app window saving as draft, but not sending.
    - *mailUnavailable*: On iOS, Mail.app services were not available.
    - *userCancelled*: The user cancelled the Mail.app window without sending.
    - *invalid*: Mail object is invalid. Common cause if of this is `sendInBackground` being true, but no recipient configured.
    - *serviceError*: Background mail service returned an error.
    - *unknownError*: An unknown error occurred.

### Functions

- **send()** *-> boolean*
  - Send the mail message.  This will open the Mail.app sending window. Returns true if the message was sent successfully or false if not - if, for example, the user cancelled the mail window.

### Class Functions

- **create()** -> Mail object
  - create a new object.

### Examples

```javascript
var mail = Mail.create();
mail.toRecipients = ["joe@sample.com"];
mail.subject = "My test message";
mail.body = "Body text";

var success = mail.send();
if (!success) {
  console.log(mail.status);
  context.fail();
}
```
