#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /usr/bin/zsh root
#cp -aT /etc/music/ /srv/http/

#useradd -m -g users -G "adm,audio,floppy,log,lp,network,rfkill,scanner,storage,systemd-journal,optical,power,wheel" -s /usr/bin/zsh ali

mkdir -p /build-tmp
git clone https://github.com/falconindy/cower /build-tmp
cd /build-tmp
make
make install
make clean
cd /
rm -r /build-tmp

chmod 750 /etc/sudoers.d
chmod 440 /etc/sudoers.d/g_wheel

mkdir -p /srv/http/cmsms
wget -O /srv/http/http-tmp/cmsms.tar.gz http://s3.amazonaws.com/cmsms/downloads/11431/cmsmadesimple-1.11.9-full.tar.gz
tar -zxvf /srv/http/http-tmp/cmsms.tar.gz -C /srv/http/cmsms

mkdir -p /srv/http/fengoffice
wget -O /srv/http/http-tmp/fengoffice.zip http://switch.dl.sourceforge.net/project/opengoo/fengoffice/fengoffice_2.3.2.1/fengoffice_2.3.2.1.zip
unzip /srv/http/http-tmp/fengoffice.zip -d /srv/http/fengoffice

wget -O /srv/http/http-tmp/mediawiki.tar.gz http://download.wikimedia.org/mediawiki/1.21/mediawiki-1.21.2.tar.gz
tar -zxvf /srv/http/http-tmp/mediawiki.tar.gz -C /srv/http

wget -O /srv/http/http-tmp/jinzora.zip http://garr.dl.sourceforge.net/project/jinzora/Jinzora%203.0/jinzora-3.0.zip
unzip /srv/http/http-tmp/jinzora.zip -d /srv/http

#mkdir -p /srv/http/wordpress
wget -O /srv/http/http-tmp/wordpress.tar.gz http://wordpress.org/latest.tar.gz
tar -zxvf /srv/http/http-tmp/wordpress.tar.gz -C /srv/http/

#touch /srv/http/wordpress/wp-config.php

chown http:http /srv/http/*

chmod 777 /srv/http/cmsms/tmp/*
chmod 777 /srv/http/cmsms/uploads/images/
chmod 777 /srv/http/cmsms/uploads/
chmod 777 /srv/http/cmsms/modules/

chmod 777 /srv/http/mediawiki-1.21.2/mw-config/*

chmod 777 /srv/http/jinzora-3.0/data/
chmod 777 /srv/http/jinzora-3.0/data/artists/
chmod 777 /srv/http/jinzora-3.0/data/cache/
chmod 777 /srv/http/jinzora-3.0/data/cache/discussions/
chmod 777 /srv/http/jinzora-3.0/data/cache/featured/
chmod 777 /srv/http/jinzora-3.0/data/cache/nodes/
chmod 777 /srv/http/jinzora-3.0/data/cache/request/
chmod 777 /srv/http/jinzora-3.0/data/cache/tracks/
chmod 777 /srv/http/jinzora-3.0/data/counter/
chmod 777 /srv/http/jinzora-3.0/data/cache/
chmod 777 /srv/http/jinzora-3.0/data/database/
chmod 777 /srv/http/jinzora-3.0/data/database/discussions/
chmod 777 /srv/http/jinzora-3.0/data/discussions/
chmod 777 /srv/http/jinzora-3.0/data/downloads/
chmod 777 /srv/http/jinzora-3.0/data/featured/
chmod 777 /srv/http/jinzora-3.0/data/featured/albums
chmod 777 /srv/http/jinzora-3.0/data/featured/artists
chmod 777 /srv/http/jinzora-3.0/data/backend/
chmod 777 /srv/http/jinzora-3.0/data/images
chmod 777 /srv/http/jinzora-3.0/data/ratings
chmod 777 /srv/http/jinzora-3.0/data/tracks
chmod 777 /srv/http/jinzora-3.0/data/users
chmod 777 /srv/http/jinzora-3.0/data/viewed
chmod 777 /srv/http/jinzora-3.0/temp/
sh /srv/http/jinzora-3.0/configure.sh

chmod 777 /srv/http/fengoffice/config/
chmod 777 /srv/http/fengoffice/cache/
chmod 777 /srv/http/fengoffice/upload/
chmod 777 /srv/http/fengoffice/tmp/

chmod 777 /srv/http/wordpress/wp-content

rm -r /srv/http/http-tmp

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist

#sed -i\ define('FS_METHOD', 'direct'); /srv/http/wordpress/wp-config.php

systemctl enable multi-user.target pacman-init.service choose-mirror.service
