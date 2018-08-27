---
title: WordPress
category: object
---

Script integration with [WordPress](http://wordpress.org) sites via the [WordPress XML-RPC API](https://codex.wordpress.org/XML-RPC_WordPress_API). Currently this object has one `runMethod` function which can be used to call any method available in the XML-RPC interface.

The WordPress API offers access to a wide variety of functions, including posting, but also retrieving information about categories, tags - or reading posts contents.

Drafts WordPress object simplifies working with the XML-RPC interface by accepting input parameters as Javascript objects and converting them to the require XML to make requests of the WordPress site. Similarly, it converts to XML returned by WordPress to Javascript objects. Otherwise it is an exact passthrough, so the [WordPress API reference](https://codex.wordpress.org/XML-RPC_WordPress_API) should be used to determine method names (e.g. `wp.newPost`, `wp.getTaxonomies`) available, the appropriate parameters to send.

The WordPress XML-RPC API authenticates via username and password, so it is highly recommended you interact only over HTTPS secure connections, and use {% ref Credential %} objects to store host/username/password values, rather than hard-coding them in actions.

### Convenience Functions

Several convenience wrapper functions are provided to ease common tasks interacting with WordPress. In all cases, refer to the [WordPress API reference](https://codex.wordpress.org/XML-RPC_WordPress_API) on the values expected and return values. In the case of these methods, a full response object is not returned. If the result is `undefined` the call failed. If it succeeded, the result will contain the value returned by WordPress parsed from their original XML to Javascript values.

- **getPost(postID)** _-> object_
- **newPost(content)** _-> string_
- **getPosts(_ filter: Any?)** _-> array of objects_
- **getPostStatusList()** _-> array of objects_
- **getTaxonomy(_ taxonomy: String?)** _-> object_
- **getTaxonomies()** _-> array of object_   
- **getTerms(_ taxonomy: String?, _ filter: Any?)** _-> array of term objects_
- **getCategories()** _-> array of term objects_
- **getTags()** _-> array of term objects_

### Functions

- **runMethod(methodName, parameters)** *-> {% ref XMLRPCResponse %}*
  - Run an XML-RPC API method on a WordPress site. Any method name supported by the [WordPress XML-RPC API](https://codex.wordpress.org/XML-RPC_WordPress_API) can be used, as long as the authentication information provided has appropriate permissions on the site.
  - **Parameters:**
    - **methodName** _[string]_: The method name as documented in the WordPress XML-RPC API, for example `wp.newPost` to create a new post.
    - **parameters** _[array of values]_: Parameters should be a Javascript array of parameters for the method being used. These vary depending on the method and should follow the documentation provided by WordPress.

### Class Functions

- **create(siteURL, blogID, username, password)** *-> WordPress*
  - Creates a new WordPress object to interact with a specific install of WordPress.
  - **Parameters:**
    - **siteURL** *[string]*: This should be the full URL to the home page of the WordPress site. e.g. `https://mysite.com` or `https://mysite.com/blog/`.
    - **blogID** _[integer]_: For most WordPress installations, use `1`.
    - **username** _[string]_: Username to login to the WordPress site. Optional if only using `runMethod`, as credentials will be required directly in parameters for those calls.
    - **password** _[string]_: Password to login to the WordPress site. Optional if only using `runMethod`, as credentials will be required directly in parameters for those calls.

### Examples

```javascript
// setup values to use in post
let title = draft.processTemplate("[[title]]");
let body = draft.processTemplate("[[body]]");

// create credentials for site
let cred = Credential.createWithHostUsernamePassword("WordPress", "WordPress credentials. Include full URL (with http://) of the home page of your WordPress site in the host field.");
cred.authorize();

// create WordPress object and make request
let wp = WordPress.create(cred.getValue("host"), 1, "", "");
let method = "wp.newPost"
let params = [
	1, // blog_id, in most cases just use 1
	cred.getValue("username"),
	cred.getValue("password"),
	{
		"post_title": title,
		"post_content": body,
		"post_status": "draft",
		"terms_names" : { // assign categories and tags
			"category" : ["Cat1", "BAD"],
			"post_tag" : ["Test1", "NOT-TAG"]
		}
	}
];

let response = wp.runMethod(method, params);
if (response.success) {
	let params = response.params;
	console.log("Create WordPress post id: " + params[0]);
}
else {
	console.log("HTTP Status: " + response.statusCode);
	console.log("Fault: " + response.error);
	context.fail();
}
```
