# Home Assistant Community Add-on: Network UPS Tools

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports i386 Architecture][i386-shield]

![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Discord][discord-shield]][discord]
[![Community Forum][forum-shield]][forum]

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

An addon for the [TuyaGateway][tuyagateway] application. TuyaGateway listens on MQTT topics and routes requests to your Tuya devices. In earlier versions the configuration was based on a one to one topic translation in e.g. Home-Assistant
config-files.

Also included is [GismoCaster][gismocaster], which offers a webinterface in which you can add/alter/delete devices and setup the dps properties. This configuration is written to your MQTT broker as a retain message. TuyaGateway and Home Assistant are listening for these autodiscovery topics.


## About

For more information about the Tuya Gateway and how to use it, please see the [TuyaGateway wiki][tuyagateway-wiki]. More information on GizmoCaster can be found on the [GismoCaster wiki][gismocaster-wiki]

## Support

Got questions?

You have several options to get them answered:

- The [documentation](DOCS.md)
- The [Home Assistant Community Add-ons Discord chat server][discord] for add-on
  support and feature requests.
- The [Home Assistant Discord chat server][discord-ha] for general Home
  Assistant discussions and questions.
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Contributing

This is an active open-source project. We are always open to people who want to
use the code or contribute to it.

We have set up a separate document containing our
[contribution guidelines](CONTRIBUTING.md).

Thank you for being involved! :heart_eyes:

## Authors & contributors

The original setup of this repository is by [Daniel Rich][sjthespian].

For a full list of all authors and contributors,
check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2020 Daniel Rich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://buymeacoff.ee/sjthespian
[commits-shield]: https://img.shields.io/github/commit-activity/y/sjthespian/addon-tuyagateway.svg
[commits]: https://github.com/sjthespian/addon-tuyagateway/commits/master
[contributors]: https://github.com/sjthespian/addon-tuyagateway/graphs/contributors
[sjthespian]: https://github.com/sjthespian
[discord-ha]: https://discord.gg/c5DvZ4e
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[docs]: https://github.com/sjthespian/addon-tuyagateway/blob/master/DOCS.md
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/community-hass-io-add-on-network-ups-tools/68516
[gitlabci-shield]: https://gitlab.com/sjthespian/addon-tuyagateway/badges/master/pipeline.svg
[gitlabci]: https://gitlab.com/sjthespian/addon-tuyagateway/pipelines
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/sjthespian/addon-tuyagateway/issues
[license-shield]: https://img.shields.io/github/license/sjthespian/addon-tuyagateway.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2020.svg
[project-stage-shield]: https://img.shields.io/badge/project%20stage-experimental-yellow.svg
[reddit]: https://reddit.com/r/homeassistant
[releases-shield]: https://img.shields.io/github/release/sjthespian/addon-tuyagateway.svg
[releases]: https://github.com/sjthespian/addon-tuyagateway/releases
[repository]: https://github.com/sjthespian/repository
[tuyagateway]: https://github.com/TradeFace/tuyagateway
[tuyagateway-wiki]: https://github.com/TradeFace/tuyagateway/wiki
[gismocaster]: https://github.com/TradeFace/gismocaster
[gismocaster-wiki]: https://github.com/TradeFace/gismocaster/wiki
