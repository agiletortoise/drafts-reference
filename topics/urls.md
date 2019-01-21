---
title: URLs
category: topics
---

{% include back.html title="Topics" path="/topics" %}

Drafts implements URL actions based on [the x-callback-url specification](http://x-callback-url.com/), and registers the **drafts5:** URL scheme.  All actions below should be formatted as follows:

- `drafts5://x-callback-url/[actionName]?[queryParameters]`

All URLs should be proper valid URLs with URL encoded values in query arguments. With a few exceptions, all actions support x-callback-url x-success, x-error and x-cancel arguments where appropriate.

*NOTE: Some URL scheme parameters and actions require a Pro subscription.* {% include pro.html %}

## Supported Actions

### /create

Create a new draft with the content passed in the "text" argument. If an x-success url is provided, it will be called the `uuid` parameter indicating the UUID of the draft which was created.

- **Arguments**
  - **text** *[string, required]* : Text to be used at the content of the new draft.
  - **tag** *[string]* : Name of a tag to attach to the draft. Parameter can appear multiple times to add more than one tag.
  - **action** *[string, optional]* : Name of an action in the action list. If provided, this action will be run on the specified draft.
  - **allowEmpty** *[boolean, optional]* : If an action parameter is provided, adding `allowEmpty=false` to the URL will prevent that action from running if the text is empty. This can be used to terminate a loop of x-callback-urls running on lines of a draft.
  - **retParam** *[string, optional]* : The name of the argument to use to pass the draft UUID back to the x-success URL.  Defaults to "uuid", but if the requesting app expects another value (like Workflow's "input") use this argument to override.
- **Examples**
  - `drafts5://x-callback-url/create?text=Hello%20World`
    - Create new draft with the content "Hello World"

### /open

Open an existing draft based on the UUID argument.

- **Arguments**
  - **uuid** *[string, required]* : The UUID identifier for a draft.
  - **action** *[string, optional]* : Name of an action in the action list. If provided, this action will be run on the specified draft.
  - **allowEmpty** *[boolean, optional]* : If an action parameter is provided, adding `allowEmpty=false` to the URL will prevent that action from running if the text is empty. This can be used to terminate a loop of x-callback-urls running on lines of a draft.
- **Examples**
  - `drafts5://x-callback-url/open?uuid=UUID-TO-VALID-DRAFT`
    - Open the draft in the editor with the UUID provided.

### /get

Return the current content of the draft specified by the UUID argument as an argument to the x-success URL provided.

- **Arguments**
  - **uuid** *[string, required]* : The UUID identifier for a draft.
  - **retParam** *[string, optional]* : The name of the argument to use to pass the draft content back to the x-success URL.  Defaults to "text", but if the requesting app expects another value (like Workflow's "input") use this argument to override.
- **Examples**
  - `drafts5://x-callback-url/get?uuid=UUID-TO-VALID-DRAFT&x-success=APP-URL`
    - Retrieves the content of the identified draft, and calls the x-success URL with the argument `text=DRAFT-CONTENT` added.

### /prepend

Prepend the passed text to the beginning of a draft identified by the UUID argument.

- **Arguments**
  - **uuid** *[string, required]* : The UUID identifier for a draft.
  - **text** *[string, required]* : Text to add.
  - **action** *[string, optional]* : Name of an action in the action list. If provided, this action will be run on the specified draft.
  - **allowEmpty** *[boolean, optional]* : If an action parameter is provided, adding `allowEmpty=false` to the URL will prevent that action from running if the text is empty. This can be used to terminate a loop of x-callback-urls running on lines of a draft.
  - **tag** *[string]* : Name of a tag to attach to the draft. Parameter can appear multiple times to add more than one tag.
- **Examples**
  - `drafts5://x-callback-url/prepend?uuid=UUID-TO-VALID-DRAFT&text=TEXT-TO-ADD`
    - Adds "TEXT-TO-ADD" to the beginning of the draft.

### /append

Append the passed text to the end of a draft identified by the UUID argument.

- **Arguments**
  - **uuid** *[string, required]* : The UUID identifier for a draft.
  - **text** *[string, required]* : Text to add.
  - **action** *[string, optional]* : Name of an action in the action list. If provided, this action will be run on the specified draft.
  - **allowEmpty** *[boolean, optional]* : If an action parameter is provided, adding `allowEmpty=false` to the URL will prevent that action from running if the text is empty. This can be used to terminate a loop of x-callback-urls running on lines of a draft.
  - **tag** *[string]* : Name of a tag to attach to the draft. Parameter can appear multiple times to add more than one tag.
- **Examples**
  - `drafts5://x-callback-url/append?uuid=UUID-TO-VALID-DRAFT&text=TEXT-TO-ADD`
    - Adds "TEXT-TO-ADD" to the end of the draft.

### /replaceRange

Replace content in an existing draft, based on a range.

- **Arguments**
  - **uuid** *[string, required]* : The UUID identifier for a draft.
  - **text** *[string, required]* : Text to insert in the specified range
  - **start** *[integer, required]* : Start position of the range to replace.
  - **length** *[integer, required]* : Number of characters in the range to replace.
- **Examples**
  - `drafts4://x-callback-url/replaceRange?uuid=UUID-TO-VALID-DRAFT&text=TEXT-TO-INSERT&start=0&length=10
`
    - Open the draft and replace characters 0 through 10 with TEXT-TO-INSERT.

### /search

Open drafts directly to the draft search field.

- **Arguments**
  - **query** *[string, optional]* : Initial text to use in the search.
  - **tag** *[string, optional]* : Tag to use to filter the query.
- **Examples**
  - `drafts5://x-callback-url/search?query=QUERY-TEXT`

### /workspace

Open drafts directly the draft list with a named workspace selected.

- **Arguments**
  - **name** *[string, required]* : Name of a saved workspace to load.
- **Examples**
  - `drafts5://x-callback-url/workspace?name=WORKSPACE-NAME`

### /loadActionGroup

Load an action group in the action list side panel.

- **Arguments**
  - **name** *[string, required]* : Name of a valid action group to load.
- **Examples**
  - `drafts5://x-callback-url/loadActionGroup?name=WORKSPACE-NAME`

### /loadKeyboardActionGroup

Load an action group in the extended keyboard row.

- **Arguments**
  - **name** *[string, required]* : Name of a valid action group to load.
- **Examples**
  - `drafts5://x-callback-url/loadKeyboardActionGroup?name=WORKSPACE-NAME`

### /runAction

Run a drafts action on the passed text without saving that text to a draft.

- **Arguments**
  - **text** *[string, required]* : Text to add.
  - **action** *[string, optional]* : Name of an action in the action list. If provided, this action will be run on the specified draft.
  - **allowEmpty** *[boolean, optional]* : If an action parameter is provided, adding `allowEmpty=false` to the URL will prevent that action from running if the text is empty. This can be used to terminate a loop of x-callback-urls running on lines of a draft.
- **Examples**
  - `drafts5://x-callback-url/prepend?uuid=UUID-TO-VALID-DRAFT&text=TEXT-TO-ADD`
    - Adds "TEXT-TO-ADD" to the beginning of the draft.
  - `drafts5://x-callback-url/runAction?text=TEXT&action=VALID-ACTION-NAME`
    - If found, runs the VALID-ACTION-NAME action on an unsaved draft containing "TEXT".

### /dictate

Open Drafts dictation interface. Pass the resulting dictated text to the x-success URL instead of saving it in Drafts.

- **Arguments**
  - **locale** *[string, optional]* : Locale identifier to use for dictation, in the standard language-country abbreviated format. Examples: en-US (English-United States), it-IT (Italian-Italy), es-MX (Spanish-Mexico), etc.  Any locale supported by Siri dictation can be used.
  - **retParam** *[string, optional]* : The name of the argument to use to pass the draft content back to the x-success URL.  Defaults to "text", but if the requesting app expects another value (like Workflow's "input") use this argument to override.
- **Examples**
  - `drafts5://x-callback-url/dictate?x-success=APP-URL`
    - Retrieves the content of the identified draft, and calls the x-success URL with the argument `text=DICTATED-TEXT` added.

### /arrange

Open Drafts arrange interface. Pass the resulting arranged text to the x-success URL instead of saving it in Drafts.

- **Arguments**
  - **text** *[string, required]* : Text to arrange.
  - **retParam** *[string, optional]* : The name of the argument to use to pass the draft content back to the x-success URL.  Defaults to "text", but if the requesting app expects another value (like Workflow's "input") use this argument to override.
- **Examples**
  - `drafts5://x-callback-url/arrange?x-success=APP-URL`
    - Retrieves the content of the identified draft, and calls the x-success URL with the argument `text=ARRANGED-TEXT` added.
