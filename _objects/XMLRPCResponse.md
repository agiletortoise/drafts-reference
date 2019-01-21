---
title: XMLRPCResponse
category: object
---

XMLRPCResponse objects are returned by calls to using XML-RPC interfaces.

### Instance Properties

- **success** *[boolean]*: true/false for whether the request was completed successfully. This value will be true if both the HTTP status code is 200 and no fault code was returned from the API.
- **statusCode** *[number]*: The HTTP status code (like 200, 301, etc.) returned. This will be 200 if communication with the XML-RPC endpoint was successful, even if a fault occurred processing the request. Be sure to use the `success` property and `faultCode` to check for errors.
- **params** [array of parameters]: The array of return parameters provided by with the XML-RPC response. Contents of this array will vary with the XML-RPC API being used.
- **faultCode** *[int]*: If the XML-RPC interface returned an error, the error code will be here.
- **error** *[string]*: If an error occurred, a description of the type of error.
