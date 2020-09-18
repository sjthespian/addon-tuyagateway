#!/usr/bin/env bashio

# Array of started process IDs
WAIT_PIDS=()

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
bashio::log.info "Log level set to $LOGLEVEL"

# Port for GismoCaster
GCPORT=8111

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
tuyagateway -ll ${LOGLEVEL} &
WAIT_PIDS+=($!)

# GismoCaster
# Copy web dir into /data so the db paths work correctly
if [ ! -d /data/web ]; then
  mkdir /data/web
fi
find /web -print | cpio -pdm /data/
cd /data
# create database dir and populate if needed
if [ ! -d var/db ]; then
  bashio::log "Creating database directory"
  mkdir -p var/db
fi
if [ ! -f var/db/.initialized-v1.0 ]; then
  bashio::log "No GismoCaster database found, initializing..."
  rm -rf var/db
  python3 web/manage.py migrate
  python3 web/manage.py loaddata component topic template topicvalue componentvalue setting
  python3 web/manage.py createsuperuser --username admin --password admin --email admin@admin.com
  touch var/db/.initialized-v1.0
fi
echo "UPDATE mqtt_setting SET value='${MQTT_HOST}' WHERE name='mqtt_host'; UPDATE mqtt_setting SET value='${MQTT_PORT}' WHERE name='mqtt_port'; UPDATE mqtt_setting SET value='${MQTT_USER}' WHERE name='mqtt_user'; UPDATE mqtt_setting SET value='${MQTT_PASSWORD}' WHERE name='mqtt_pass';" | sqlite3 /data/var/db/db.sqlite3

bashio::log.info "Start GismoCaster daemon"
python3 web/manage.py runserver 0.0.0.0:${GCPORT} --noreload &
WAIT_PIDS+=($!)

# Handling Closing
function stop_tuyagateway() {
    bashio::log.info "Shutdown Tuya Gateway system"
    kill -15 "${WAIT_PIDS[@]}"

    wait "${WAIT_PIDS[@]}"
}
trap "stop_mqtt" SIGTERM SIGHUP

# Wait and hold Add-on running
wait "${WAIT_PIDS[@]}"
