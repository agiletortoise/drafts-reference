---
title: Prompt
category: object
---

Prompts allow the creation and display of custom dialogs.

### Properties

- **title** *[string]*
  - The title of the dialog.
- **message** *[string]*
  - A longer message explaining the purpose of the dialog, if needed.
- **isCancellable** *[bool]*
  - If true, a "Cancel" button will be included in the dialog. Defaults to true. If the user selects the cancel button, the `show()` method will return false. If false, no cancel button will be displayed and the user must select one of the button name options.
- **fieldValues** *[dictionary of values]*
  - After the `show()` method is called, this property will contain values from any fields added to the prompt. The dictionary keys will be the names of the fields as passed in when they were created, and the value will be the current contents of that field.  They type of data depends on the type of field.
- **buttonPressed** *[string]*
  - After the `show()` method is called, this property will contain the name of the button selected by the user.

### Functions

- **addTextField(name, label, initialText, options)**
  - Add a text input field to the prompt, with the arguments as follows:
    - **name** _[string]_: Identifier for the field. This will be used as the key in the `fieldValues` dictionary to access the contents of the field after calling `show()`.
    - **label** _[string]_: User-friendly text label to place next to the field.
    - **initialText** _[string]_: The initial text contents for the field.
    - **options** _[object]_: A dictionary of options for configuring the text field. Currently supported option keys below.
      - **placeholder** _[string]_: Text to display as a placeholder if the field is empty.
      - **autocorrect** _[boolean]_: true or false to enable autocorrect.
      - **autocapitalization** _[string]_: Valid values are "none", "sentences", "words".
      - **keyboard** _[string]_: Type of keyboard to display. Valid values are "default", "numbersAndPunctuation", "numberPad", "phonePad", "namePhonePad", "emailAddress", "decimalPad", "webSearch", "URL". More information on types in [Apple's Documentation](https://developer.apple.com/documentation/uikit/uikeyboardtype)
- **addTextView(name, label, initialText, options)**
  - Add a text input field to the prompt, with the arguments as follows:
    - **name** _[string]_: Identifier for the field. This will be used as the key in the `fieldValues` dictionary to access the contents of the field after calling `show()`.
    - **label** _[string]_: User-friendly text label to place next to the field.
    - **initialText** _[string]_: The initial text contents for the field.
    - **options** _[object]_: A dictionary of options for configuring the text field. Currently supported option keys below.
      - **height** _[number]_: Preferred height of text input area in points.
      - **autocorrect** _[boolean]_: true or false to enable autocorrect.
      - **autocapitalization** _[string]_: Valid values are "none", "sentences", "words".
      - **keyboard** _[string]_: Type of keyboard to display. Valid values are "default", "numbersAndPunctuation", "numberPad", "phonePad", "namePhonePad", "emailAddress", "decimalPad", "webSearch", "URL". More information on types in [Apple's Documentation](https://developer.apple.com/documentation/uikit/uikeyboardtype)
- **addPasswordField(name, label, initialValue)**
  - Same as `addTextField`, but the input field will be password masked.
- **addSwitch(name, label, initialValue)**
  - Add an on/off toggle switch. The fieldValues entry for this item will be a true/false boolean indicating whether the switch was on.
    - **name** _[string]_: Identifier for the field. This will be used as the key in the `fieldValues` dictionary to access the contents of the field after calling `show()`.
    - **label** _[string]_: User-friendly text label to place next to the field.
    - **initialValue** _[boolean]_: true/false to indicate if the switch should be on or off when initially displayed.
- **addDatePicker(name, label, initialDate, options)**
  - Add a date and/or time picker to the prompt, with the arguments as below. The fieldValues entry for this will be a date object.
    - **name** _[string]_: Identifier for the field. This will be used as the key in the `fieldValues` dictionary to access the contents of the field after calling `show()`.
    - **label** _[string]_: User-friendly text label to place next to the field.
    - **initialDate** _[date]_: The initial date to selected for the field. Minimum and maximum values should be defined in options.
    - **options** _[object]_: A dictionary of options for configuring the date picker. Currently supported option keys below.
      - **mode** _[string]_: Configure type of date picker. Supported modes:
        - *date*: Show only date.
        - *time*: Show only time.
        - *dateAndTime* (default): Show both date and time.
      - **minimumDate** _[date]_: Lowest selectable date.
      - **maximumDate** _[date]_: Highest selectable date.
      - **minuteInterval** _[number]_: How many minutes between each selectable time interval. 60 must be divisible by this number. Example: 15 for minute intervals.
- **addSelect(name, label, values, selectedValues, allowMultiple)**
  - Add a select control. Returns an array of string values in fieldValues.
    - **name** _[string]_: Identifier for the field. This will be used as the key in the `fieldValues` dictionary to access the contents of the field after calling `show()`.
    - **label** _[string]_: User-friendly text label to place next to the field.
    - **values** _[array of strings]_: The array of string values that will be available to select.
    - **selectedValues** _[array of strings]_: Array of string values that should be initially selected when the prompt is displayed. All values in this array should match values in the `values` array.
    - **allowMultiple** _[boolean]_: If false, selecting a value will deselect all other values. If true, the user may select multiple items.
- **addButton(name)**
  - Add a button to the array of buttons to be displayed.  All buttons should be created *before* calling `show()`.
- **show()** *-> Bool*
  - Displays the prompt, return true if the user selected one of the buttons in the buttons array, false if the user selected the "Cancel" button.  After the dialog has been show, the `buttonPressed` property will contain the name of the button selected by the user.

### Class Functions

- **create()** *-> Prompt*
  - Creates a new Prompt object. 

### Examples

```javascript
var p = Prompt.create();

p.title = "Hello";
p.message = "World!";

p.addTextField("textFieldName", "Label", "");

p.addDatePicker("myDate", "Start date", new Date(), {
  "mode": "date"
});
p.addButton("First");
p.addButton("Second");

var didSelect = p.show();

var textFieldContents = p.fieldValues["textFieldName"];
var startDate = p.fieldValues["myDate"];

if (p.buttonPressed == "First") {
  // do something
}
```
