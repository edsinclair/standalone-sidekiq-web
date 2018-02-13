# Standalone Sidekiq Web

Launch a standalone Sidekiq Web dashboard via Docker

## Build

```
$> docker build -t sidekiq-web:dev .
```

## Run

```

$> docker run --rm -e REDIS_URL="<redis url>" -P -it --name sidekiq-web sidekiq-web:dev
```

## Monitor

```
$> open "http://$(docker port sidekiq-web | cut -d ' ' -f 3)"
```

## Configuration

```
REDIS_SIZE: Concurrency setting (default: 1)
REDIS_URL: The redis host URL (default: redis://localhost:6379/0)
REDIS_NAMESPACE: The redis namespace (default: sidekiq)
SIDEKIQ_CRON: Set to true to enable the Sidekiq Cron view (default: false)
SIDEKIQ_USERNAME: HTTP Basic Auth username
SIDEKIQ_PASSWORD: HTTP Basic Auth password
```

**NOTE:** To enable HTTP Basic Auth you must set BOTH `SIDEKIQ_USERNAME` and `SIDEKIQ_PASSWORD`.
