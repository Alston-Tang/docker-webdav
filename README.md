# NGINX WebDAV container

Usage:

```bash
docker run --restart always --detach --name webdav --publish 7000:8080 \
           --env UID=$UID --volume $PWD:/media ionelmc/webdav
```

Optionally you can add two environment variables to require HTTP basic authentication:

* WEBDAV_USERNAME
* WEBDAV_PASSWORD

By default, webdav server will listen to port 8080. You can override that by

* WEBDAV_PORT=[PORT_NUMBER]

Example:

```bash
docker run --restart always --detach --name webdav --publish 7000:8080 \
           --env WEBDAV_USERNAME=myuser --env WEBDAV_PASSWORD=mypassword \
           --env WEBDAV_PORT=1234 \
           --env UID=$UID --volume $PWD:/media ionelmc/webdav
```
