# Q3-server-docker-webUI
A Quake 3 Server Docker compose file for running Quake 3 server w/ Web UI.

![ScreenShot](https://github.com/kalik1/q3-server-docker-webUI/blob/master/screenshot_q3.png)
![ScreenShot](https://github.com/kalik1/q3-server-docker-webUI/blob/master/screenshot_q3_map.png)

## Quick Start
- Clone the repo \
`git clone https://github.com/kalik1/q3-server-docker-webUI`

- Cd folder \
`cd q3-server-docker-webUI`

- Copy inside ./build/ the original `pak0.pk3`.  \
You can copy it from your original Quake3 Arena CD-ROM. If _**and only if**_ you own a copy of original quake 3 copy, you can search and download it from the web.

- Build \
`docker-compose build`

- Profit \
`docker-compose up -d`

## Linked Projects:
- [q3-server-docker-rest-api](https://github.com/kalik1/q3-server-docker-rest-api "q3-server-docker-rest-api") \
Quake 3 rest API w/ websocket for interacting with RCON

- [q3-server-docker-webUI-angular](https://github.com/kalik1/q3-server-docker-webUI-angular "q3-server-docker-webUI-angular") \
Frontend for QUAKE3 Server w/ WebUI
