---
title: App
category: object
---

Drafts defines a single global "app" object which provides access to application level functions.

#### Instance Properties

- **version** *[string, readonly]*
	- Version number of current installation of Drafts.
- **themeMode** *[string]*
	- Get or set themeMode. Valid modes:
		- **light**
		- **dark**
		- **automatic**
- **isDraftListVisible** *[boolean, readonly]*
	- Is the draft list side panel is visible.
- **isActionListVisible** *[boolean, readonly]*
	- Is the action list side panel is visible.
- **isIdleDisabled** *[boolean]*
	- Is system sleep timer disabled preventing screen dimming/sleep.

#### Instance Functions

- **openURL(url, useSafari)** *-> boolean*
  - opens URL passed using iOS. Returns true if URL was opened, false if the URL was invalid or no available app can open the URL on the device. The second, optional useSafari is a true/false flag to open the URL in Safari View Controller.
- **queueAction(action, draft)** *-> boolean*
  - Queues an action to run on a draft after the current action is complete. Actions can be obtained using the `Action.find(name)` method.
- **selectDraft()** *-> {% ref Draft %}*
	- Open draft selection interface and wait for user to select a draft. Returns the select draft object, or undefined if user cancelled.
- **User Interface**
	- **showDraftList()**
		- Open draft list side bar.
	- **hideDraftList()**
		- Close draft list side bar.
	- **showActionList()**
		- Open action list side bar.
	- **hideActionList()**
		- Close action list side bar.
	- **applyWorkspace({% ref workspace %})** *-> boolean*
		- Apply the {% ref Workspace %} as if it was selected in draft list.
	- **loadActionGroup({% ref actionGroup %})** *-> boolean*
		- Load the {% ref ActionGroup %} in the action list side bar.
	- **loadKeyboardActionGroup({% ref actionGroup %})** *-> boolean*
		- Load the {% ref ActionGroup %} in the extended keyboard row.
	- **setIdleDisabled(*boolean*)**
		- Enable and disable the iOS system sleep timer to prevent screen dimming/sleep.
- **Clipboard**
	- **getClipboard()** *-> string*
	  - Get current contents of the system clipboard.
	- **setClipboard(string)**
	  - Set the contents of the system clipboard.
	- **htmlToClipboard(html)** *-> boolean*
	  - Takes HTML string and converts it to rich-text and places it in the system clipboard. Returns true if successful, false if an error occurred in conversion.
- **Messages**
	- **displaySuccessMessage(message)**
		- Show success banner notification with the message passed.
	- **displayInfoMessage(message)**
		- Show info banner notification with the message passed.
	- **displayWarningMessage(message)**
		- Show warning banner notification with the message passed.
	- **displayErrorMessage(message)**
		- Show error banner notification with the message passed.

#### Examples

```javascript
// open a URL
var url = "http://agiletortoise.com/";
var result = app.openURL(url);
```

```javascript
// prompt user to select a draft...
var draft = app.selectDraft();
if (draft) { // make sure they didn't cancel
	// update draft as needed
}
```

```javascript
// Process Markdown to HTML
var mmd = MultiMarkdown.create();
var html = mmd.render(draft.content);

// Wrap raw MMD output with HTML template with styles to set base fonts.
var template = "<html><style>body{font-family:'Helvetica';font-size:100%;}</style><body>[[content]]</body></html>"
var html = template.replace("[[content]]", html);

// Place in clipboard as rich-text
if (!app.htmlToClipboard(html)) {
	context.fail("Error rendering rich text from HTML.");
}
```
