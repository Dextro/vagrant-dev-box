# update the main pecl channel
php_pear_channel 'pecl.php.net' do
  action :update
end

# gearman (manual install php_pear fails)
execute "pecl-gearman" do
    command "pecl install gearman"
    notifies :restart, resources(:service => "php5-fpm"), :delayed
    not_if "php -m | grep gearman"
end

# gearman ini
template "#{node['php']['ext_conf_dir']}/gearman.ini" do
  source "gearman.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

# XHProf
php_pear "xhprof" do
  action :install
  notifies :restart, resources(:service => "php5-fpm"), :delayed
end