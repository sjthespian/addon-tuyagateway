#!/usr/bin/env bashio

# Build config file from options
CONFIG_PATH=/data/options.json

# Get MQTT settings from a services call
MQTT_HOST=$(bashio::services mqtt "host")
MQTT_PORT=$(bashio::services mqtt "port")
MQTT_USER=$(bashio::services mqtt "username")
MQTT_PASSWORD=$(bashio::services mqtt "password")

# If they cannot be determined by a services call, use the configuration settings
if [ -z "$MQTT_HOST" -o -z "$MQTT_PORT" ]; then
  MQTT_USER="$(bashio::config 'mqttuser')"
  MQTT_PASSWORD="$(bashio::config 'mqttpass')"
  MQTT_HOST="$(bashio::config 'mqtthost')"
  MQTT_PORT="$(bashio::config 'mqttport')"
fi

LOGLEVEL="$(bashio::config 'loglevel')"

bashio::log.info "Generate Tuya Gateway configuration"
# Generate configuration file
cat <<EOFEOF > /etc/tuyagateway.conf
[General]
topic: tuya
payload_on: ON
payload_off: OFF
availability_online: online
availability_offline: offline

[MQTT]
user: ${MQTT_USER}
pass: ${MQTT_PASSWORD}
host: ${MQTT_HOST}
port: ${MQTT_PORT}
EOFEOF

bashio::log.info "Start Tuya Gateway daemon"
tuyagateway -ll ${LOGLEVEL}
