# Shore.
## Simply Short.

Shore is a simple-as-hell API-driven URL shortening application. Perfect for deploying within a controlled / enterprise environment, Shore accepts long URLs and provides easy-to-read and -type short links.

Shore's shortened slugs are perfect for inclusion in PDFs and physical documents, as they contain only non-ambiguous characters (for example, there are no O's or zeroes in any of the slugs to avoid confusion). Shore utilizes the `readable_random` gem for this functionality.

## API

### Shorten a URL

```
Method:           GET
URL:              /shorten
Authenticated:    API_TOKEN         Environment variable set per-application
Parameters:
  url             string  required  The URL to be shortened
Response:
  plain_text      string            Fully-qualified shortened URL
Request Example:
  GET             /shorten?url=http://google.com
Response Example:
  "http://shore.envisionapp.com/Z4fq7y"
```

Accessing the link returned from the `/shorten` API method will perform a 301 redirect to the URL specified in the request parameters.

## Contributing to Shore

* Fork the [official repository](http://github.com/ennova/shore).
* Make your changes in a topic branch.
* Send a pull request.

## Credits

Shore was written by Jason Weathered and Lucas Willett.

![Ennova](http://cdn.ennova.com.au/images/ennova.png)

Shore is maintained and funded by [Ennova](http://ennova.com.au)

## License

Copyright &copy; 2010-2011 Ennova Pty Ltd. It is free software, and may be redistributed under the terms specified in the LICENSE file.
