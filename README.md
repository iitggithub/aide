# AIDE

This image is a CentOS 7 based container which contains the AIDE (Advanced Intrusion Detection Environment) file and directory integrity checker.

# Supported Versions

AIDE Version | Git branch | Tag name
-------------| ---------- |---------
0.15.1       | master     | latest
0.15.1       | 0.15.1     | 0.15.1

# Getting Started

There's two ways to get up and running, the easy way and the... less... easy way.

## The Easy Way (Standalone)

Fire up AIDE

```
docker run -d --name aide -v /data/apache/aide:/var/lib/aide iitgdocker/aide:latest
```

## The Less Easy Way (Docker Compose)

The github repo contains a docker-compose.yml you can use as a base. The docker-compose.yml is compatible with docker-compose 1.5.2+.

```
aide:
  image: iitgdocker/aide:latest
  volumes:
    - /data/apache/aide:/var/lib/aide
```

By running 'docker-compose up -d' from within the same directory as your docker-compose.yml, you'll be able to bring the container up.

# Volumes

## AIDE Integrity Database /var/lib/aide

/var/lib/aide contains the AIDE integrity database file aide.db.tar.gz. If this file does not exist when the container starts, it will be created automatically. It is strongly recommended that this file be backed up to a secure location. This database is your baseline from which all filesystem changes are compared against so keep a copy somewhere safe.

If aide_init.sh finds a file called aide.conf in this directory, AIDE will use this instead of its default configuration file.

If changes are made to the container after its been started, you'll probably need to update the AIDE integrity database. You can do this from outside of the container by running the following command against your container:

Replace container_name with the name/id of your running container.

```
docker exec -it <container_name> /usr/sbin/aide --init
docker exec -it <container_name> mv -vf /tmp/aide.db.new.gz /var/lib/aide/aide.db.gz
```

# Environment Variables

None.

# The End
