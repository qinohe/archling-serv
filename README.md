#archling-serv,  ArchLinux, with Apache MariaDB PHP, and some webapps.


I called this project 'archling-serv'
These files can be build into an ISO with archiso  https://wiki.archlinux.org/index.php/Archiso.
Software from The Arch Linux project.

Builds are only pushed to this repo if they're considered stable to me.
Test are done by converting these files with archiso into an ISO, and running the ISO on VirtualBox 
Great care has been taken creating these files, however, there could always be something, not *working for you. 
Please mail me, or search the ArchLinux wiki  https://wiki.archlinux.org ,
or use the ArchLinux forum  https://bbs.archlinux.org to find your answer.
By any means, please do not open new treads on the Arch boards about this build, read the Arch 
forum etiquette  https://wiki.archlinux.org/index.php/Forum_Etiquette, before you do, thanks
Or use the thread I used to announce this build, archling-serv thread https://bbs.archlinux.org/viewtopic.php?id=170872

Email (qinohe)[add](g(mail)(com)


##The build:


Server(LAMP):
* File size around 830KiB
* Arch basic releng x86_64 (only)
* Apache web server
* MariaDB, a MySQL database server
* PHP, hypertext preprocessor

Webapps:
* PhpMyAdmin, administration tool for MySQL
* CMS Made Simple, content management system
* Dokuwiki, simple versatile wiki software
* Feng Office, a web office with lots of possibilities 
* Jinzora-3.0 a music management server/jukebox
* Checkout packages.x86_64
* All webapps are downloaded  and unpacked to the right dir.,during building the ISO with archiso.
* Change this to your needs, you could install many webapps this way, like Joomla or Subsonic.
* The necessary rights are set, take a look at 'customize_root_image.sh'
* All rights that should be set to your webapp dirs/files. after installation is of course up to you. 


##Building the files


Download the zip or fork the project
Install archiso[extra] or archiso-git[AUR], the latter is what I build with.
The  ISO will be around 360MiB.
Create a folder (as user) in your $HOME, and name it something like 'archling-serv', but you can name it what you like...
As root copy/move the unzipped files to the folder you just created.
Run as root, './build.sh -v' and if everything goes well, the ISO will be created for you by archiso.
You may see some WARNING, about skipping the target(a lot), just ignore that, it should build your ISO just fine.
Depending on your hardware, this might take a while, from 3 min. up to ….. (tell me)
Be sure to visit the archiso wiki page https://wiki.archlinux.org/index.php/Archiso, that made this whole project possible.


##Using the ISO


On the ISO is 1 user, root, without password.
If you run the ISO, the complete environment will be up and running, you don't need to bother about enabling httpd or mysqld.
DHCP is used to set the network, I have no plans to change this.

https://wiki.archlinux.org/index.php/MariaDB  is usable without password.
This is of course a 'very dangerous' situation, change to your needs, or leave it.

Webapps are not setup, meaning; 'first-run' still has to be executed, for your name, password(s), email etc, excluding: phpMyAdmin and dokuwiki.
PhpMyAdmin is usable right away, and dokuwiki is usable without doing anything, but very limited.
You should install plugins for webapps yourself. 

##How to use the webapps:


PhpMyAdmin http://www.phpmyadmin.net/  is used with user “root”, no password.
PhpMyAdmin will give you warnings, if you want get rid of them, 
go ahead give passwords and that kind of things, but it didn't bother me so I left that to you.

CMS Made Simple  http://www.cmsmadesimple.org/, a content management system.
CMSms is not able to address the Mariadb db, so you have to help a bit.
Create an empty database, 'cmsms' for instance, no password needed, phpMyAdmin, will do the job...
Fill in the forms , using db name you just created, user is 'root' no passwd.
CMS Made Simple will file the db.
And there you have a very nice content management system, not so bloated as some others maybe, but very usable.
Don't forget to remove the install folder, the link is in the zsh history, use your up arrow,  (remove the cmsms install dir!)

Dokuwiki  https://www.dokuwiki.org/dokuwiki, a nice project to create your own wiki.
I installed this one for myself too, so I can hobby around a bit with a wiki, 
cause I have never actually edited one myself, and that is a missed opportunity I guess, so here it is.
Just fill the forms and you're good to go.

Feng Office  http://www.fengoffice.com], is a 'Web Office', as their devs call it.
Just fill the form and a nice 'Web Office Suite' will be at you're command.
Call db something like fengoffice, no passwd.needed
Feng Office will just find MariaDB, create a db and fill it, no additional work;)

Jinzora-3.0  http://sourceforge.net/projects/jinzora/ is a media/jukebox server.
Creating the ISO will put jinzora in setup mode (see ,customize_root_image.sh) for more info.  
You can start using it right away, no need to hustle with rights management, on directories, or run configure.sh, that's all been done for you.
Fill out the 'Main Page' form. 
Backend setup; only change: create database into 'True', no password needed.
After install, you need to remove the install dir., this message is printed in your browser.
The link is in the zsh history, use your up arrow,  (remove the jinzora install dir!)
You have to provide the music yourself, there is no demo or some-, but it'll work.


##Installing from the ISO


The arch-install-scripts are available on this ISO.

This project was never meant to.be installed as is, if you want to have this changed,  please provide install scripts for this build.

I'm open to suggestions, if you want to, you can provide code to make this an even better project.
It  must add something useful to the build of course,. maybe some nice webapps to include...


##Thanks


Thank you all, 
for reading this, for trying my build, and for giving me feedback about this build...
qinohe


##Disclaimer


It should go without saying,   you should check everything before you use the files.
These files do not exist as ISO or image on the internet. 
You are not allowed to redistribute or sell these files, without exclusive permission of all owners of products available on this build.
I have taken great care, not to violate owners-rights of  files/sofware.
However, if there are files on this build, that are in any way violating copyright, 
copyleft or whatever 'right' you 'have' on the files, please contact me at (qinohe)[add](g(mail)(com) and I will remove the files . 
Thanks, qinohe

Only run this ISO in an isolated network, or be sure you are behind a 'good firewall'.
Don't hook it up directly to the Internet, you're just a 'sitting duck', keep that in mind.
This project is a learning thing and for the fun of creating it, but it's not safe by any means.
You can improve security a little bit, by using MariaDB with a  passwd.etc etc
Iptables is installed, you have to provide the rules yourself.
