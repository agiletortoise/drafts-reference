---
title: Editor
category: object
---

A global "editor" object is available in all action scripts. This object allows manipulation of the main editing window in Drafts, altering the text, text selections, or loading a different draft into the editor, etc.

Typically scripting actions that work like custom keyboard commands and similar will utilize the editor functions to manipulate text.

**NOTE:** _Generally speaking, editor methods are best used for quick text manipulations of the type used in the extended keyboard. Most substantial updates to draft content are better applied using the `draft` object._

#### Instance Properties

- **focusModeEnabled** *[boolean]*
  - Access or set current focus mode status.
- **linkModeEnabled** *[boolean]*
  - Access or set current link mode status.

#### Instance Functions

- **new()**
  - Creates a new blank draft and loads it into the editor.
- **load(draft)**
  - Loads an existing draft into the editor.
- **save()**
  - Save any current changes to the draft.
- **undo()**
  - Apply undo action to editor, if one is available.
- **redo()**
  - Apply redo action to editor, if available.
- **activate()**
  - Request focus for the editor. This will dismiss other views and show the keyboard on the currently loaded draft. Useful if an action opens user interface elements or otherwise causes the editor to resign focus and you would like to return to editing at the end of the action's execution.
- **deactivate()**
  - Resign focus for the editor. If the editor text view is currently focused for editing (e.g. showing keyboard), resign focus.
- **showArrange()**
  - Open arrange mode in editor. This is a non-blocking method and returns immediately. It is intended only to mimic the tapping of the arrange button. Use `editor.arrange(text)` to wait for a result.
- **arrange(text)** -> *[string]*
  - Opens the arrange mode view with the passed text for arranging. Returns the arranged text if the user makes changes and taps "Done", the original text if the user cancels.
- **showFind()**
  - Open find mode in editor.
- **showDictate()**
  - Open dictation mode in editor. This is a non-blocking method and returns immediately. It is intended only to mimic the tapping of the dictate button. Use `editor.dictate()` to wait for a result and use it in further scripting.
- **dictate(locale)** *-> string*
  - Open dictation interface, and return the result as a string. The string will be empty if user cancels. Optionally, the preferred locale can be passed in the format "en-US" (U.S. English), "it-IT" (Italian-Italian), "es-MX" (Mexican Spanish), etc.
- **getText()** *-> string*
  - Get the full text currently loaded in the editor.
- **setText(string)**
  - Replace the contents of the editor with a string.
- **getSelectedText()** *-> string*
  - Get text range that was last selected.
- **setSelectedText(string)**
  - Replace the contents of the last text selection with a string.
- **getSelectedRange()** *-> [location, length]*
  - Get the last selected range in the editor. Returns an a with the start location of the range and the length of the selection.
- **getSelectedLineRange()** *->[location, length]*
  - Get the current selected text range extended to the beginning and end of the lines it encompasses.
- **setSelectedRange(number, number)**
  - Update the text selection in the editor by passing the start location and the length of the new selection.
- **getTextInRange(number, number)** *-> string*
  - Get the substring in a range from the text in the editor.
- **setTextInRange(number, number, string)**
  - Replace the text in the passed range with new text.

#### Examples

```javascript
var sel = editor.getSelectedText(); // retrieve selected text
var selRange = editor.getSelectedRange(); // retrieve range of that selection

if (!sel || sel.length == 0) {
  // if there was no selection, insert Markdown bold (**)
  editor.setSelectedText("**");
  // update the selected range to the end of the inserted text
  editor.setSelectedRange(selRange[0]+2,0);
}
else {
  // If there was a selection, wrap that text with Markdown bold (**) and replace selection
  editor.setSelectedText("**"+sel+"**");
  // Update the selected range to the end of the inserted text
  editor.setSelectedRange(selRange[0]+selRange[1]+4,0);
}
```
