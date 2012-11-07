Description
===========

A template for provisioning any new [Vagrant](http://vagrantup.com/)
project that will will install a core set of useful packages as well as
personal dotfiles. It uses [Chef Solo](http://vagrantup.com/docs/provisioners/chef_solo.html)
and includes support for using [`knife`](http://wiki.opscode.com/display/chef/Knife)
commands with the local _cookbooks/_ directory.

The installed packages include:

* ack
* curl
* dkms
* git
* lsof
* tmux
* vim
* zsh (dotfiles are bash at the moment)

This is all based on [the vagrant-init of Aaron Bull Schaefer](https://raw.github.com/elasticdog/vagrant-init).

Usage
=====

I'll only use Debian, so the Vagrant box is a Debian Squeeze 64-bit base box.
If it is not already available, it will download a fresh and blank base box
I made myself.
You can easily replace the box by a different Debian or Ubuntu base box.
Other distro's are completely untested.

    $ git clone git://github.com/Dextro/vagrant-init.git myproject
    $ cd myproject/
    $ git submodule init
    $ git submodule update
    $ vagrant up

Attributes
----------

Everything should be customized based on your requirements, as this is
only meant as a initial template.

All of the included packages are specified in the `vagrant_main`
cookbook's default recipe, so start there if you want to make changes.

`knife` Metadata
----------------

When using the `knife` command, the contents of the generated cookbook
README and metadata files are configurable by editing _&lt;myproject&gt;/.chef/knife.rb_.
See `knife cookbook create --help` for details.

Requirements
============

Platform
--------

* Debian
* Ubuntu

User
----

The recipes currently assume that your VM is using the standard `vagrant`
user with a home directory of _/home/vagrant_.


License
=======

Copyright (c) 2012, [Bert Pattyn](mailto:bert@dextrose.be)

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
