---
title: XMLRPC
category: object
---

The XMLRPC object is a convenience method to provide an easy way to [XML-RPC](http://xmlrpc.scripting.com) web services. The `request` function takes care of converting native Javascript objects and values to the XML parameters required for the XML-RPC interface, and converts the XML responses returned to Javascript objects.

It will also return faults parsed to error messages in the response if necessary.

This object is suitable for communication with a number of popular XML-RPC interfaces, including the [MetaWeblog API](http://xmlrpc.scripting.com/metaWeblogApi.html). WordPress also offers it's own XML-RPC interface, which can be used via this object, or the convenience wrapper {% ref WordPress %} object.

### Class functions

- **request(url, methodName, params)** _-> XMLRPCResponse_
  - Make an XML-RPC request.
  - **Parameters:**
    - **url** _[string]_: The full URL of the XML-RPC host endpoint being called.
    - **methodName** _[string]_: Name of the method to call. Supported values are specific to the services provided by the host.
    - **params** _[array of values]_: The parameters to pass to the request. This should be an array of values, in the proper order, as specified by the documentation of the host being called. This array will be encoded into XML-RPC parameters in XML format by the method - only raw javascript values should be provided.

### Examples

```javascript
// DEMO of XML-RPC
// Calls example method on http://xml-rpc.net/index.html

let url = "http://www.cookcomputing.com/xmlrpcsamples/RPC2.ashx";
let methodName = "examples.getStateName";
let params = [20];

let response = XMLRPC.request(url, methodName, params);

if (response.success) {
	alert(JSON.stringify(response.params));
}
else {
	alert("Fault: " + response.faultCode + ", " + response.error);
	context.fail();
}

```
