TICE-enable-webdav
==================

Enable WebDAV user directory from CSV file for Scribe (READ ONLY)

Script to enable WebDAV for users on a Scribe server (French Educational server)

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
