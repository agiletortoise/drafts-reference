---
title: Drafts Scripting Reference
---

This wiki will contain reference documentation and example scripts for use with Drafts 5 and greater.

- **More information about Drafts?** [Visit getdrafts.com](http://getdrafts.com/)
- **Need help with an action script?** [Join the Drafts Community](https://forums.getdrafts.com/)

### JavaScript Environment

Scripting in Drafts uses Apple's implementation of [JavaScriptCore](https://developer.apple.com/documentation/javascriptcore). It provides a complete, modern implementation of the JavaScript language and supports [ECMAScript 6](https://webkit.org/blog/6756/es6-feature-complete/).

The scripting environment provide only the core language, and does not include extensions often found in browsers like the DOM and XHTTPRequest. The documentation on this site cover the library provided by Drafts specific to its features.

### Actions and Action Step Execution

Scripts in Drafts reside in [script action steps](http://getdrafts.com/actions/steps/script). Any Drafts action with one or more script steps, gets a JavaScript context to run those steps. Multiple steps in the same action will execute in the same context, so global variables and functions defined in one step will be available to other steps in the same action.
