# Docker Dev-Env

Maintainer: @macwinnie <git@macwinnie.me>

## System-Requirements

This Environment is thought to set up a web development environment on MacOS and Debian Linux systems. It does not provide any IDE, Docker-Host-Installation, etc.

Required are:

* `python` / `python3` installed
* `pip` – `python`-Library installed
* `Docker` installed

## Folder structure

```
./
├── README.md
│
├── config        # holds definition files for all other scripts
│
├── container     # subfolders are `categories`, bejond them the
│   │             # definition files for containers are sorted
│   ├── default
│   └── system
│       ├── database.sh    # `system.database`
│       │                  #    is a MariaDB container
│       ├── phpmyadmin.sh  # `system.phpmyadmin`
│       │                  #    provides a PMA instance
│       ├── portainer.sh   # `system.portainer`
│       │                  #    provide Porainer instance
│       └── traefik.sh     # `system.traefik`
│                          #    manages HTTP(S) Requests as reverse proxy
│
├── create.sh     # script for creation of new definition files
│
├── manage.sh     # script for managing containers
│
└── templates     # folder for Jinja2 templates used by scripts
```

## How to use

The Scripts should be located in an Dev-Folder – i.e. `~/Development/init_docker`. There will be created a folder structure under `~/Development/container` (directory `container` placed in the parent folder of `init_docker` directory) where Container-Data will live in.

After installation by `git clone https://github.com/macwinnie/docker_devenv.git ~/Development/init_docker`, you can do the following:

### Create a new Container-Definition-File

For creating a new definition file, you can simply run `./create.sh` within the `init_docker` directory. The script will lead you through the creation process by asking you some questions.

### Manage container

Managing containers is easy through the `./manage.sh` script. The container definiton files are sorted by so called categories for some structure. The resulting container is named after the shema `category.container`.