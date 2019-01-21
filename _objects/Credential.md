---
title: Credential
category: object
---

Credential objects can be used in actions which require the user to provide a username, password and optionally a host name, to connect to a service. By using credentials objects, actions can be written to connect to arbitrary web services without hard coding credentials into the action.

When an `authorize()` call is made on a credential object for the first time, the user is prompted to enter their credentials, then Drafts stores those for later use. When the action is used again, there will be no prompt required and the stored credentials will be used.

Credentials objects have unique identifiers, and a single set of user credentials can be used across actions by using the same identifier.

The user can delete those credentials at any time by visiting Settings > Credentials and tapping the "Forget" button on a service.

### Class Functions

- **create(identifier, description)** *-> Credential*
  - Create a credential object with the specified identifier and description. Identifiers should be unique, such that any two calls from different actions with the same identifier will return the same credentials
- **createWithUsernamePassword(identifier, description)** *-> Credential*
  - Create credential already configured with username and password fields.
- **createWithHostUsernamePassword(identifier, description)** *-> Credential*
  - Create credential already configured with host url, username and password fields.

### Instance Functions

- **authorize()** *-> boolean*
  - Call this function after configuring, but before using host, username or password properties of a credential. If the credential object has not be previous authorized, the user will be prompted to enter their credentials before continuing.  If the user has previously been prompt, this method will load previously provided information.
- **getValue(key)** *-> string*
  - Get the value the user stored for the key, as defined in a call to add the field.
- **addTextField(key, label)**
  - Add a text field for data entry. Key is used to retrieve the value, label is displayed to the user.
- **addPasswordField(key, label)**
    - Add a secure entry text field for data entry. Key is used to retrieve the value, label is displayed to the user.
- **addURLField(key, label)**
  - Add a text field for configured for URL data entry. Key is used to retrieve the value, label is displayed to the user.
- **forget()**
  - Deletes the credentials provided by the user. This is the same as the user visiting settings and tapping "Forget" for the credentials.

### Examples

```javascript
var credential = Credential.create("My Service", "Description of the service to appear in user prompt.");

credential.addTextField("username", "Username");
credential.addPasswordField("password", "Password");

credential.authorize();

var http = HTTP.create();
var response = http.request({
  "url": "http://myurl.com/api",
  "username": credential.getValue("username"),
  "password": credential.getValue("password"),
  "method": "POST",
  "data": {
    "key":"value"
  },
  "headers": {
    "HeaderName": "HeaderValue"
  }
});

```
