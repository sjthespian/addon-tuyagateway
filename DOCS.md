# Home Assistant Add-on: TuyaGateway

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Click on the three dots in the upper left, then **Repositories**, and add this repository: https://github.com/sjthespian/addon-tuyagateway
3. Find the "TuyaGateway" add-on and click it.
4. Click on the "INSTALL" button.

## How to use

1. No configuration is necessary for the Tuya Gateway if you are running MQTT on your Home Assistant server or to run GizmoCaster on its default port. If not, in the TuyaGateway add-on configuration, perform the following:
    - Add your MQTT username and password if any.
    - Update MQTT host IP address and port if you aren't running MQTT on your Home Assistant server.
    - Optionally change the GismoCaster port.
2. Click the **Start** button to start the add-on.
3. Check the Log tab to insure the add-on started and is communicating to your MQTT broker.

**NOTE: GismoCaster may take a while to start the first time as it has to create and populate the database**

## Configuration

Optional add-on configuration for Tuya Gateway if no MQTT server running on HA:

```yaml
mqttuser: ""
mqttpass: ""
mqtthost: 127.0.0.1
mqttport: 1883
```

GizmoCaster will automatically have the mqtt database values configured from the installed mqtt broker or the settings above if one is not running on each start. This will override the values entered through the Web UI.

#### Option `mqttuser`

Username for authenticating to the MQTT broker

#### Option `mqttpass`

Password for authenticating to the MQTT broker

#### Option `mqtthost`

IP or hostname of the MQTT broker. The default should work if your MQTT broker is running on your Home Assitant instance.

#### Option `mqttport`

Network port of the MQTT server. The default should work if your MQTT broker is running on the standard port.

For example:

```yaml
mqttuser: mqttuser
mqttpass: mqttpass
mqtthost: 127.0.0.1
mqttport: 1883
```

## Known issues and limitations

- None

## Support

Got questions?

You have several options to get them answered:

- The [TuyaGateway Wiki][tuyagateway-wiki].
- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/hassio-addons/issues
[reddit]: https://reddit.com/r/homeassistant
[tuyagateway]: https://github.com/TradeFace/tuyagateway
[tuyagateway-wiki]: https://github.com/TradeFace/tuyagateway/wiki
