#!/bin/sh
if [ ! -z "$STATSD_AWS_CONSUL" ]; then
  echo -e "{{key \"/config/statsd/config-tpl\"}}\n" > /tmp/key.ctmpl
  /usr/local/bin/consul-template -template "/tmp/key.ctmpl:/statsd/aws-config.ctmpl" -once
  if [ -r /statsd/aws-config.ctmpl ];then
    /usr/local/bin/consul-template -template "/statsd/aws-config.ctmpl:/statsd/aws-config.js" -once
    node /usr/local/bin/statsd/stats.js /statsd/aws-config.js
  fi 
else 
  "$@"
fi
