# tere - a faster alternative to cd + ls

This is a Debian repository for [tere](https://github.com/mgunyho/tere).

## Installation

`.deb` files are published as [releases](https://github.com/bauerei/tere/releases) on GitHub and as repository, which can be added as third-party repository for `apt`.

## Install .deb file from release

Download `.deb` file of the version you like to install from [releases](https://github.com/bauerei/tere/releases).

Install downloaded `.deb` file

```shell
# From path where .deb file was downloaded. Adapt file name as needed
apt install ./tere_1.5.1_amd64.deb
```

## Install via third-party apt repository

Download certificate to trust the certificate used for signing the files in this repository

```shell
curl -o /etc/apt/keyrings/tere-archive-keyring.pgp "https://bauerei.github.io/tere/tere-archive-keyring.pgp"
```

`/etc/apt/keyrings` might not exist and must be created first, as described [here](https://wiki.debian.org/DebianRepository/UseThirdParty#OpenPGP_certificate_distribution)

> In releases older than Debian 12 and Ubuntu 22.04, /etc/apt/keyrings does not exist by default. It SHOULD be created with permissions 0755 if it is needed and does not already exist.

Add the repository to your sources.list 

```shell
curl -o /etc/apt/sources.list.d/tere.list "https://bauerei.github.io/tere/tere.list"
```

Fetch available packages from this repo

```shell
apt update
```

Install latest version of tere

```shell
apt install tere
```
