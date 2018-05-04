---
title: Twitter
category: object
---

Script integration with [Twitter](http://twitter.com). The `updateStatus` method is a convenience method for posting a tweet, but the entire [Twitter API](https://developer.twitter.com/en/docs/api-reference-index) can be used with the `request` method, which handles OAuth authentication and authorization.

### Properties

- **lastResponse** *[object]*
  - If a function success, this property will contain the last response returned by Twitter. The JSON returned by Twitter will be parsed to an object and placed in this property. Refer to [Twitter API documentation](https://developer.twitter.com/en/docs/api-reference-index) for details on the contents of this object based on call made.
- **lastError** *[string]*
  - If a function fails, this property will contain the last error as a string message, otherwise it will be undefined.

### Functions

- **updateStatus(content)** *-> boolean*
  - Post a status update (tweet) to Twitter. Returns true if successful, false if not. After success the lastResponse object can be used to inspect response and get details such as the ID of the tweet created. Refer to [Twitter API POST /status/update documentation](https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/post-statuses-update) for response details.
  - **Parameters**
    - content *[string]*: The string content of the tweet to post.
- **request(settings)** *-> [HTTPResponse]({{ site.baseurl }}/objects/HTTPResponse)*
  - Execute a request against the Twitter API. For successful requests, the HTTPResponse object will contain an object or array or objects decoded from the JSON returned by Twitter as appropriate to the request made. Refer to Twitter's API documentation for details about the expected parameters and responses. Drafts will handle wrapping the request in the appropriate OAuth authentication flow.
  - parameters:
    - **settings** [object]: A javascript object supporting the following options:
      - *url* [string, required]: The full URL to the endpoint in the [Twitter API](https://developer.twitter.com/en/docs/api-reference-index).
      - *method* [string, required]: The HTTP method, like "GET", "POST", etc.
      - *headers* [object, optional]: An object contain key-values to be added as custom headers in the request. There is no need to provide authorization headers, Drafts will add those.
      - *parameters* [object, optional]: An object containing key-values to be added to the request as URL parameters.
      - *data* [object, optional]: An object containing data to be encoded into the HTTP body of the request.

### Class Functions

- **create(identifier)** *-> Twitter*
  - Creates a new Twitter object. Identifier is a optional string value used to identify a Twitter account. Typically this can be omitted if you only work with one Twitter account in Drafts. Each unique identifier used for Twitter accounts will share credentials - across both action steps and scripts.

### Examples

```javascript
// create twitter object
var twitter = Twitter.create();
// post tweet
var success = twitter.updateStatus("My tweet content!");

if success {
  console.log(twitter.lastResponse);
}
else {
  console.log(twitter.lastError);
  context.fail();
}
  ```
