# Vagrant DEV BOX

A Vagrant Development Box setup for developing PHP web applications.

## Description

This is a Vagrant (http://www.vagrantup.com) development setup to ease the development of PHP web applications.

It uses [Chef Solo](http://vagrantup.com/docs/provisioners/chef_solo.html)
for provisioning and includes support for using [`knife`](http://wiki.opscode.com/display/chef/Knife) commands with the local _.cookbooks/_ directory.

The main packages are (version numbers can be newer):

* nginx 1.1.19
* php 5.3.10 (php-fpm)
  * apc
  * curl
  * gd
  * intl
  * mbstring
  * memcache
  * mysql
  * mysqli
  * openssl
  * PDO (with pdo_mysql and pdo_sqlite)
  * sqlite
  * xdebug
  * xmlrpc
* mysql 5.5.28

The other packages include:

* ack
* curl
* dkms
* git
* lsof
* tmux
* vim
* sendmail
* [dotfiles](https://github.com/wijs/dotfiles-server)
* PHPUnit

## Usage

I'll use the default Ubuntu Precise 64 basebox.
If it is not already available, it will download the base box from [vagrantup.com](http://files.vagrantup.com/precise64.box)

    $ git clone https://github.com/Dextro/vagrant-dev-box.git myproject
    $ cd myproject/
    $ git submodule update --init
    $ vagrant up

There are 2 hidden folders, .roles and .cookbooks.
The default role is web_base.json.    

## configuration

The configuration can be changed in the role.
If you want a specific configuration for a project, create a new role.

## default setup

You can put your app in the _www_ folder. The project is accessible on http://localhost:8080

Mysql is reachable on port 8306.

* The root user has password _root_.
* There is by default a database _vagrant_ and it is reachable with user _vagrant_ and password _vagrant_.

## `knife` Metadata

When using the `knife` command, the contents of the generated cookbook
README and metadata files are configurable by editing _&lt;myproject&gt;/.chef/knife.rb_.
See `knife cookbook create --help` for details.

## Todo

new role web_base_extra based on web_base and with:

* [gearman](http://gearman.org)
* [xhprof](http://pecl.php.net/package/xhprof)
* [Capistrano](https://github.com/capistrano/capistrano)
* [Varnish](https://www.varnish-cache.org/)
* [redis](http://redis.io/)
* [MongoDB](http://www.mongodb.org/)

## License

Copyright (c) 2012, [Bert Pattyn](mailto:dextro@dextrose.be)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
