# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.5] - 2020-09-18
### Added
- Patch from @3v1n0 to prevent database not being initialized if the plugin is aborted on intial startup [PR3](https://github.com/sjthespian/addon-tuyagateway/pull/3)
### Bug fixes
- Fix for permissions on docker entrypoint [#6](https://github.com/sjthespian/addon-tuyagateway/issues/6)
- Documentation update for tuyagateway upgrade instructions [#4](https://github.com/sjthespian/addon-tuyagateway/issues/4)

## [0.4] - 2020-07-31
### Added
- Ingres support

## [0.3] - 2020-07-30
### Added
- Auto-provision the MQTT settings int he GismoCaster database on each startup

## [0.2] - 2020-07-30
### Added
- Includes GismoCaster
- Auto-provisions MQTT settings if Mosquitto is running on the HA server

## [0.1] - 2020-07-30
### Added
- New add-on for Tuya Gateway
