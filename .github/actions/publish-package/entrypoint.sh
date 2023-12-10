#!/bin/bash

GPG_SIGNING_KEY=$1
GPG_KEY_PASS=$2
GPG_KEY_ID=$3

echo "cd into ppa folder"
cd ppa

echo "Import signing key"
# Export private key with:
# gpg --export-secret-keys <id> | base64 > private_base64.key
echo -n "$GPG_SIGNING_KEY" | base64 --decode | gpg --batch --import 2>/dev/null

# Packages & Packages.gz
echo "Create Packages"
dpkg-scanpackages --multiversion . > Packages
echo "Create Packages.gz"
gzip -k -f Packages

# Release, Release.gpg & InRelease
echo "Create Release"
apt-ftparchive release . > Release
echo "Create Release.gpg"
gpg --batch --pinentry-mode loopback --passphrase "$GPG_KEY_PASS" --default-key "$GPG_KEY_ID" -abs -o - Release > Release.gpg 2>/dev/null
echo "Create InRelease"
gpg --batch --pinentry-mode loopback --passphrase "$GPG_KEY_PASS" --default-key "$GPG_KEY_ID" --clearsign -o - Release > InRelease 2>/dev/null
