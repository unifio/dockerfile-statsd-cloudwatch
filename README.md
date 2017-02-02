# dockerfile-statsd-cloudwatch
Containerized version of statsd with cloudwatch backend and support for autoloading configuration via consul KV.

## Loading consul with configuration template
The configuration template file will require the following kvs: 

```
config/statsd/aws-cw/accessKeyId
config/statsd/aws-cw/iamRole
config/statsd/aws-cw/region
config/statsd/aws-cw/secretAccessKey
config/statsd/config-tpl
```

The `config/statsd/config-tpl` kv should contain the entire configuration template similar to [example config-tpl](config_examples/config.ctpl) 

If an IAM role is being used only the `iamRole` and `region` are required in addition to the `config-tpl`. If an `accesskey` is being used the `iamRole` details can be omitted. 

## Configuration options for cloudwatch backend

See [aws-cloudwatch-statsd-backend](https://github.com/unifio/aws-cloudwatch-statsd-backend)

## Configuration options for statsd 

See [statsd](https://github.com/etsy/aws-cloudwatch-statsd-backend)

All configuration should be combined in the config-tpl kv an example of some of these options are available in: [example config-tpl](config_examples/config.ctpl)

_The console backend should be disabled when not debugging._