# docker minecraft server

## _minecraft server in docker_
 [![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/powered-by-jeffs-keyboard.svg)](https://forthebadge.com) [![forthebadge](https://forthebadge.com/images/badges/contains-cat-gifs.svg)](https://forthebadge.com)

[![docker-minecraft-server](https://github.com/Bensuperpc/docker-minecraft-server/actions/workflows/main.yml/badge.svg)](https://github.com/Bensuperpc/docker-minecraft-server/actions/workflows/main.yml)

# New Features !

  - Add github CI and update submodule

### Install
You need Linux distribution like Ubuntu or Manjaro

```sh
git clone --recurse-submodules https://github.com/Bensuperpc/docker-minecraft-server.git
```

### Usage

#### Start server

```sh
make start
```

#### Stop server

```sh
make stop
```

### Server website 
The server must be started!

#### Dynmap
http://127.0.0.1:8123/

#### Rcon (CMD...)
http://127.0.0.1:4326/

#### Minecraft Plan (Need to config)
http://127.0.0.1:8804/

#### Grafana (If start-full.sh)
http://127.0.0.1:3000/

#### Cadvisor (If start-full.sh)
http://127.0.0.1:8180/

#### Prometheus (Disabled by default)
http://127.0.0.1:9090/

### Todos

 - Write Tests
 - Continue dev. :D

### More info : 
- https://github.com/itzg/docker-minecraft-server

License
----

MIT License


**Free Software forever !**
