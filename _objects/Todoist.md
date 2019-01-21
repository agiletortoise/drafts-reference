---
title: Todoist
category: object
---

Script integration with [Todoist](http://todoist.com). This object handles OAuth authentication and request signing. The entire [Todoist REST API](https://developer.todoist.com/rest/v8) can be used with the `request` method, and convenience methods are provided for common API endpoints to manage tasks, projects, comments and labels.

The `quickAdd` method is mostly likely what you are looking for to create tasks as it supports the shorthand the task entry box in Todoist supports to parse projects, etc.

Other methods are direct mappings of the REST API calls provided by Todoist. Most take an `options` parameter which is a javascript object containing the parameters to be passed to the API, and and the method decodes the JSON response from Todoist and returns it as a Javascript object (or array of objects) with the values as specified in the Todoist API docs.

If an API calls fails, typically the result will be an `undefined` value, and the `lastError` property will contains error detail information for troubleshooting.

### Properties

- **lastResponse** *[object]*
  - If a function success, this property will contain the last response returned by Todoist. The JSON returned by Todoist will be parsed to an object and placed in this property. Refer to [Todoist API documentation](https://developer.todoist.com/rest/v8) for details on the contents of this object based on call made.
- **lastError** *[string]*
  - If a function fails, this property will contain the last error as a string message, otherwise it will be undefined.

### Convenience Functions

#### Quick Add

- **quickAdd(text, note, reminder)** -> *[object]*
  - *parameters*
    - **text** *[string, required]*: text to use to create the task. Supports [Todoist quick add notation](https://support.todoist.com/hc/en-us/articles/115001745265-Task-Quick-Add) for specifying projects, priority, labels, etc. just as if you were using the Todoist quick add window.
    - **note** *[string, optional]*: Optional text to attach as a comment with the task.
    - **reminder** *[string, optional]*: Optional natural language date specifying for creating a task reminder.
  - See [Todoist method reference for supported options and return](https://developer.todoist.com/sync/v7/#quick)

### Tasks

- **getTasks(options)** -> *[array of objects]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#get-tasks)
- **createTask(options)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#create-a-new-task)
- **getTask(task_id)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#get-a-task)
- **updateTask(task_id, options)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#update-a-task)
- **closeTask(task_id)** -> *[boolean]*
  - Close task (mark complete)
- **reopenTask(task_id)** -> *[boolean]*
  - Reopen task (mark incomplete)

### Projects

- **getProjects()** -> *[array of objects]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#get-all-projects)
- **createProject(options)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#create-a-new-project)
- **getProject(project_id)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#get-a-project)
- **updateProject(project_id, options)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#update-a-project)

### Comments

- **getComments(options)** -> *[array of objects]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#get-all-comments)
- **createComment(options)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#create-a-new-comment)
- **getComment(comment_id)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#get-a-comment)
- **updateComment(comment_id, options)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#update-a-comment)

### Labels

- **getLabels()** -> *[array of objects]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#get-all-labels)
- **createLabel(options)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#create-a-new-label)
- **getLabel(label_id)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#get-a-label)
- **updateLabel(label_id, options)** -> *[object]*
  - See [Todoist method reference for supported options and return values](http://doist.github.io/todoist-api/rest/v8/#update-a-label)

### Functions

- **request(settings)** *-> {% ref HTTPResponse %}*
  - Execute a request against the Todoist API. For successful requests, the HTTPResponse object will contain an object or array or objects decoded from the JSON returned by Todoist as appropriate to the request made. Refer to Todoist's API documentation for details about the expected parameters and responses. Drafts will handle wrapping the request in the appropriate OAuth authentication flow.
  - **Parameters:**
    - **settings** *[object]*: A javascript object supporting the following options:
      - *url* [string, required]: The full URL to the endpoint in the [Todoist REST API](http://doist.github.io/todoist-api/rest/v8/#overview).
      - *method* [string, required]: The HTTP method, like "GET", "POST", etc.
      - *headers* [object, optional]: An object contain key-values to be added as custom headers in the request. There is no need to provide authorization headers, Drafts will add those.
      - *parameters* [object, optional]: An object containing key-values to be added to the request as URL parameters.
      - *data* [object, optional]: An object containing data to be encoded into the HTTP body of the request.

### Class Functions

- **create(identifier)** *-> Todoist*
  - Creates a new Todoist object. Identifier is a optional string value used to identify a Todoist account. Typically this can be omitted if you only work with one Todoist account in Drafts. Each unique identifier used for Twitter accounts will share credentials - across both action steps and scripts.

### Examples

See [Examples-Todoist](http://actions.getdrafts.com/g/1L3) action group in the Action Directory.

```javascript
// create Todoist object
let todoist = Todoist.create();
// create task in inbox
todoist.createTask({
  "content": "My Task Name",
  "due_string": "Next wednesday"
});
```
