---
title: HTTP
category: object
---

The HTTP and HTTPResponse objects are used to run synchronous HTTP requests to communicate with APIs, or just read pages from the web.  A full set of custom settings can be passed, and all HTTP methods (GET, POST, PUT, DELETE, etc.) are supported.

### Instance Functions

- **request(settings)** *-> [HTTPResponse]({{ site.baseurl }}/objects/HTTPResponse)*
  - parameters:
    - **settings** [object]: A javascript object supporting the following options:
      - *url* [string, required]: The HTTP URL to make the request.
      - *method* [string, required]: The HTTP method, like "GET", "POST", etc.
      - *headers* [object, optional]: An object contain key-values to be added as custom headers in the request.
      - *data* [object, optional]: An object containing data to be encoded into the HTTP body of the request.
      - *encoding* [string, optional]: Possible values:
        - *json*: Default. Encode data using JSON in request body.
        - *form*: Use traditional `application/x-www-form-urlencoded` parameter encoding for request body.
      - *username* [string, optional]: A username to encode for Basic Authentication.
      - *password* [string, optional]: A password to encode for Basic Authentication.

### Class Functions

- **create()** *-> HTTP object*
  - create a new HTTP object.

### Examples

```javascript
var http = HTTP.create(); // create HTTP object

var response = http.request({
  "url": "http://myurl.com/api",
  "method": "POST",
  "data": {
    "key":"value"
  },
  "headers": {
    "HeaderName": "HeaderValue"
  }
});

if (response.success) {
  var text = response.responseText;
  var data = response.responseData;
}
else {
  console.log(response.statusCode);
  console.log(response.error);
}
```
