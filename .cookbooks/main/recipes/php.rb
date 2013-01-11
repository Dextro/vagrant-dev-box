include_recipe "php"

# xdebug
php_pear "xdebug" do
  zend_extensions ['xdebug.so']
  directives(:profiler_enable_trigger => 1)
  action :install
end

# apc
package "php-apc"
template "#{node['php']['ext_conf_dir']}/apc.ini" do
  source "apc.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

# curl
package "php5-curl"

# gd
package "php5-gd"

# memcache
package "php5-memcache"

# sqlite
package "php5-sqlite"

# mysql
package "php5-mysql"

# php xml-rpc
package "php5-xmlrpc"

# php intl
package "php5-intl"

# php fpm
package "php5-fpm"

# php mcrypt
package "php5-mcrypt"

# php imap
package "php5-imap"

# define php5-fpm service
service "php5-fpm" do
  service_name "php5-fpm"
  restart_command "/etc/init.d/php5-fpm restart && sleep 1"
  reload_command "/etc/init.d/php5-fpm reload && sleep 1"
  action :enable
end

# php.ini is only adapted in /etc/php5/cli
# update it also in /etc/php5/fpm
template "/etc/php5/fpm/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => "php5-fpm"), :delayed
end

# fpm pool setup for user vagrant
template "#{node['php']['pool_dir']}/www.conf" do
  source "www.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, resources(:service => "php5-fpm"), :delayed
end

# pear phpunit channel
php_pear_channel "pear.phpunit.de" do
  action :discover
end

# pear auto-discover
execute "pear-auto-discover" do
    command "pear config-set auto_discover 1"
end

# phpunit
php_pear "PHPUnit" do
    channel "pear.phpunit.de"
    action :install
end