This describes the resources that make up the official Emilito API v3. If you have any problems or requests please contact support.

#### Schema
All API access is over HTTPS, and accessed from the https://api.emilito.io. All data is sent and received as JSON.

#### Parameters
Many API methods take optional parameters. For GET requests, any parameters not specified as a segment in the path can be passed as an HTTP query string parameter:

```
curl -i "https://api.emilito.io/myworkspace/tickets?state=published"
```

In this example, the 'myworkspace' value are provided for the :workspace parameter in the path while :state is passed in the query string.

For POST, PATCH, PUT, and DELETE requests, parameters not included in the URL should be encoded as JSON with a Content-Type of 'application/json':

```
curl -i -u username -d '{"state":"published"}' https://api.emilito.io/myworkspace/tickets
```

#### Root Endpoint
You can issue a GET request to the root endpoint to get all the endpoint categories that the API supports:

```
curl https://api.emilito.io
```

#### Pagination

Requests that return multiple items will be paginated to 30 items by default. You can specify further pages with the ?page parameter. For some resources, you can also set a custom page size up to 100 with the ?per_page parameter.

```
curl 'https://api.emilito.io/myworkspace/tickets?page=2&per_page=100'
```

Note that page numbering is 1-based and that omitting the ?page parameter will return the first page.
