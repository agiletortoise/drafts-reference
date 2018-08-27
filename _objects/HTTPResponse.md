---
title: HTTPResponse
category: object
---

HTTPResponse objects are returned by calls to [HTTP]({{ site.baseurl }}/objects/HTTP) methods.

#### Instance Properties

- **success** [boolean]: true/false for whether the request was completed successfully.
- **statusCode** [number]: The HTTP status code (like 200, 301, etc.) returned.
- **responseData**: The raw data returned. Typically an object or array of objects, but exact content varies by server response.
- **responseText**: The data returned as a string format.
- **otherData**: Some responses return additional data that is placed in this field.
- **error** [string]: If an error occurred, a description of the type of error.
