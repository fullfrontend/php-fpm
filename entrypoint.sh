#!/bin/sh

set -e

export APP_ENV=${APP_ENV:-dev}
export TIMEZONE=${TIMEZONE:-Europe/Brussels}

export PHP_UPLOAD_MAX_FILESIZE=${PHP_UPLOAD_MAX_FILESIZE:-100M}
export PHP_POST_MAX_FILESIZE=${PHP_POST_MAX_FILESIZE:-100M}
export PHP_MAX_EXECUTION_TIME=${PHP_MAX_EXECUTION_TIME:-30}
export PHP_ZEND_ASSERTIONS=${PHP_ZEND_ASSERTIONS:-"-1"}

if [ "$APP_ENV" = "prod" ]; then
  export PHP_DISPLAY_ERRORS=${PHP_DISPLAY_ERRORS:-Off}
  export PHP_DISPLAY_STARTUP_ERRORS=${PHP_DISPLAY_STARTUP_ERRORS:-Off}
  export PHP_OPCACHE_VALIDATE_TIMESTAMPS=${PHP_OPCACHE_VALIDATE_TIMESTAMPS:-1}
else
  export PHP_DISPLAY_ERRORS=${PHP_DISPLAY_ERRORS:-On}
  export PHP_DISPLAY_STARTUP_ERRORS=${PHP_DISPLAY_STARTUP_ERRORS:-On}
  export PHP_OPCACHE_VALIDATE_TIMESTAMPS=${PHP_OPCACHE_VALIDATE_TIMESTAMPS:-0}
fi

/usr/local/bin/confd -onetime -backend env

exec "$@"
