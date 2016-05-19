## What are some common HTTP status codes?
* 200 OK
* 300 Multiple Choices
* 301 Moved Permanently
* 302 Found
* 304 Not Modified
* 307 Temporary Redirect
* 400 Bad Request
* 401 Unauthorized
* 403 Forbidden
* 404 Not Found
* 410 Gone
* 500 Internal Server Error
* 501 Not Implemented
* 503 Service Unavailable
* 550 Permission denied
    
## What is the difference between a GET request and a POST request? When might each be used?

* Where the paramaters are located:
  * In a GET the parameters are in the URL
  * In a POST the parameters are in the body
* URL length
  * GET has a limited URL length.
  * POST has no max URL length.
* When each should be used
  * GET should be used for fetching documents
  * POST should be used for updating the server

## What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?

* Cookies are used to track website activity.  The are sent as a Header with every HTTP request.