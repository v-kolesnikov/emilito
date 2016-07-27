There are two ways to authenticate through Emilito API v3. Requests that require authentication will return 404 Not Found, instead of 403 Forbidden, in some places. This is to prevent the accidental leakage of private data to unauthorized users.

**OAuth2 Token (sent in a header)**

```
curl -H "Authorization: token OAUTH-TOKEN" https://api.emilito.io
```

**OAuth2 Token (sent as a parameter)**

```
curl https://api.emilito.io/?access_token=OAUTH-TOKEN
```
