TICE-enable-webdav
==================

Enable WebDAV user directory from CSV file for EOLE Scribe (in READ ONLY)

Script to enable WebDAV for users on a Scribe server (French Educational server)

Pre-requisites
------------
- a2enmod dav
- a2enmod dav_fs

Description
------------

What it does :
- Create the base directory /var/www/webdav/
- Copy a site config file and enables it for that base directory
- Reload apache2

- Import a CSV file containing user login and password
- Create a symbolic link from user directory to webdav directory
- Copy and modify a model config file and enables it
- Reload apache2

The problem with that script is that the user can view his documents and directory via webdav

BUT he cannot write in his own directory, the issue is the web user not allowed to write.

Usage
------------

- Edit compte-webdav.csv to add several users and their webdav passwords
- Launch enable-webdav.sh script like so : ./enable-webdav.sh
- Watch the result by going to your account via an Internet browser : http://ip/webdav/user/
- A user and password box should prompt and you should access user home dir
- You can reverse that with disable-webdav.sh 
