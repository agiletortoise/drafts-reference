---
title: Dropbox
category: object
redirect_to:
  - http://scripting.getdrafts.com/classes/dropbox
---

Dropbox objects can be used to work with files in a [Dropbox](http://dropbopx.com) account. The `read` and `write` methods are simple wrappers for uploading and reading content of files on Dropbox.

For advanced uses, the `rpcRequest`, `contentUploadRequest` and `contentDownloadRequest` methods enable direct use of any Dropbox API 2.0 endpoints. These methods are an advanced feature which return raw results from the Dropbox API and may require advanced understanding of the API to process the results. They do enable full access to the API, however, which enabled things like querying files, listing folder contents, uploading to Paper, etc. For details on availalbe methods, see [Dropbox API documentation](https://www.dropbox.com/developers/documentation/http/overview).  In the case of all of these methods Drafts takes care of the OAuth request signing and authentication process when necessary.

### Properties

- **lastError** *[string]*
  - If a function fails, this property will contain the last error as a string message, otherwise it will be undefined.

### Convenience Functions

- **read(path)** *-> string*
  - Reads the contents of the file at the path as a string. Returns undefined value if the file does not exist or could not be read. Paths should begin with a "/" and be relative to the root directory of your Dropbox.
- **write(path, content, mode, autorename)** *-> bool*
  - Write the contents of the file at the path. Returns true if successful, false if the file could not be written successfully.  This will override existing files!
  - **Parameters**
    - path *[string]* Paths should begin with a "/" and be relative to the root directory of your Dropbox
    - content *[string]*
    - mode *[string]*: Either "add" or "overwrite" to determine if the write method should overwrite an existing file at the path if it exists.
    - autorename *[boolean]*

### Functions

- **rpcRequest(settings)** *-> {% ref HTTPResponse %}*
  - Execute a request against the Dropbox API for an [endpoint of RPC type](https://www.dropbox.com/developers/documentation/http/documentation#formats). For successful requests, the HTTPResponse object will contain an object or array or objects decoded from the JSON returned by Dropbox as appropriate to the request made. Refer to Dropbox's API documentation for details about the expected parameters and responses. Drafts will handle wrapping the request in the appropriate OAuth authentication flow.
  - **Parameters:**
    - **settings** [object]: A javascript object supporting the following options:
      - *url* [string, required]: The full URL to the RPC endpoint in the [Dropbox API](https://www.dropbox.com/developers/documentation/http/documentation). RPC endpoint are typically on the `api.dropboxapi.com` domain.
      - *method* [string, required]: The HTTP method, like "GET", "POST", etc.
      - *headers* [object, optional]: An object contain key-values to be added as custom headers in the request. There is no need to provide authorization headers, Drafts will add those.
      - *parameters* [object, optional]: An object containing key-values to be added to the request as URL parameters.
      - *data* [object, optional]: An object containing data to be encoded into the HTTP body of the request. In the case of RPC requests, this should be a Javascript object with a collection of parameter keys and values appropriate to the request.
- **contentUploadRequest(settings)** *-> {% ref HTTPResponse %}*
  - Execute a request against the Dropbox API for an [endpoint of Content Upload type](https://www.dropbox.com/developers/documentation/http/documentation#formats). For successful requests, the HTTPResponse object will contain an object or array or objects decoded from the JSON returned by Dropbox as appropriate to the request made. Refer to Dropbox's API documentation for details about the expected parameters and responses. Drafts will handle wrapping the request in the appropriate OAuth authentication flow.
  - **Parameters:**
    - **settings** [object]: A javascript object supporting the following options:
      - *url* [string, required]: The full URL to the RPC endpoint in the [Dropbox API](https://www.dropbox.com/developers/documentation/http/documentation). Content upload endpoint are typically on the `content.dropboxapi.com` domain.
      - *method* [string, required]: The HTTP method, like "GET", "POST", etc.
      - *headers* [object, optional]: An object contain key-values to be added as custom headers in the request. There is no need to provide authorization headers, Drafts will add those.
      - *parameters* [object, optional]: An object containing key-values to be added to the request as URL parameters.
      - *dropbox-api-request* [object, required]: An object containing the parameters to encode in the `dropbox-api-request` header, per API documentation. Drafts will take care of properly ASCII escaping values.
      - *data* [object, required]: An object containing data to be encoded into the HTTP body of the request. This will typically be string content you wish to upload as the content of the file.
- **contentDownloadRequest(settings)** *-> {% ref HTTPResponse %}*
  - Execute a request against the Dropbox API for an [endpoint of Content Download type](https://www.dropbox.com/developers/documentation/http/documentation#formats). For successful requests, the HTTPResponse object will contain an raw data in the `responseData` property and, if the data can be converted to a string value, the text version in the `responseText` property. The HTTPResponse `otherData` property will contain a Javascript object decoded from the JSON returned in the `Dropbox-API-Result` header. Refer to Dropbox's API documentation for details about the expected parameters and responses. Drafts will handle wrapping the request in the appropriate OAuth authentication flow.
  - **Parameters:**
    - **settings** [object]: A javascript object supporting the following options:
      - *url* [string, required]: The full URL to the RPC endpoint in the [Dropbox API](https://www.dropbox.com/developers/documentation/http/documentation). Content upload endpoint are typically on the `content.dropboxapi.com` domain.
      - *method* [string, required]: The HTTP method, like "GET", "POST", etc.
      - *headers* [object, optional]: An object contain key-values to be added as custom headers in the request. There is no need to provide authorization headers, Drafts will add those.
      - *parameters* [object, optional]: An object containing key-values to be added to the request as URL parameters.
      - *dropbox-api-request* [object, required]: An object containing the parameters to encode in the `dropbox-api-request` header, per API documentation. Drafts will take care of properly ASCII escaping values.
      - *data* [object, optional]: An object containing data to be encoded into the HTTP body of the request. In the case of RPC requests, this should be a Javascript object with a collection of parameter keys and values appropriate to the request.

### Class Functions

- **create(identifier)** *-> Dropbox*
  - Creates a new Dropbox object. Identifier is a optional string value used to identify a Dropbox account.  Typically this can be omitted if you only work with one Dropbox account in Drafts.

### Examples

```javascript
// create Dropbox object
var db = Dropbox.create();

// setup variables
var path = "/test/file.txt";
var content = "text to place in file";

// write to file on Dropbox
var success = db.write(path, content, "add", true);

if (success) { // write worked!
  var dbContent = db.read(path);
  if (dbContent) { // read worked!
    if (dbContent == content) {
      alert("File contents match!");
    }
    else {
      console.log("File did not match");
      context.fail();
    }
  }
  else { // read failed, log error
    console.log(db.lastError);
    context.fail();
  }
}
else { // write failed, log error
  console.log(db.lastError);
  context.fail();
}
```
