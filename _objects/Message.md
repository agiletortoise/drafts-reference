---
title: Message
category: object
---

The Message object can be used to create and send mail iMessages, similar to those created by a "Message" action step.

### Properties

- **toRecipients** *[array]*
  - Array of phone numbers and email addresses to use as "To:" recipients.
- **subject** *[string]*
  - Subject line. Only used if subject is enabled in Messages settings on the device.
- **body** *[string]*
  - Body text of the mail message.  
- **isSent** *[boolean]*
  - true/false flag indicated if the message object has already been sent.
- **status** *[string]*
  - Contains one of the following status strings:
    - *created*: Initial value before "send()" has been called.
    - *sent*: The message was sent successfully.
    - *messagesUnavailable*: On iOS, Mail.app services were not available.
    - *userCancelled*: The user cancelled the Mail.app window without sending.
    - *unknownError*: An unknown error occurred.

### Functions

- **send()** *-> boolean*
  - Send the message.  This will open the Messages.app sending window. Returns true if the message was sent successfully or false if not - if, for example, the user cancelled the mail window.

### Class Functions

- **create()** -> Message object
  - create a new object.

### Examples

```javascript
var msg = Message.create();
msg.toRecipients = ["joe@sample.com"];
msg.subject = "My test message";
msg.body = "Body text";

var success = msg.send();
```
