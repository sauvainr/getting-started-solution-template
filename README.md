# Murano Core Load Test Template

This project includes a setup for running various load tests on Murano.

## External access

End-to-End test of Murano Solution through the public custom API.

*URL:* GET https://<solution domain>.apps.exosite.com/<path>
or
*URL:* POST https://<solution domain>.apps.exosite.com/<path>
*Payload:*
```application/json
<service call arguments>
```
*Note:*
* Only http (1.1) is supported

For path & parameters see [./endpoints/load.lua](./endpoints/load.lua)

## Internal access

Internal test by-passing edge service and directly calling Murano-Core components: Pegasus-Dispatcher or Pegasus-Engine

### From Pegasus-Dispatcher

*URL:* POST http://pegasus-dispatcher:4000/api/v1/trigger/<solution id>/scripts/<event>
*Payload:*
```application/json
{
  <event parameters>
}
```

*Note:*
* Both http or http2 are supported

For event & payload content see [./services/scripts.lua](./services/scripts.lua)

### From Pegasus-Engine

*URL:* POST http://pegasus-engine:5000/execute/<solution id>/scripts_<event>
*Payload:*
```application/json
{
  <event parameters>
}
```

*Note:*
* Both http or http2 are supported

For event & payload content see [./services/scripts.lua](./services/scripts.lua)
