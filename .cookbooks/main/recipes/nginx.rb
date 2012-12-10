include_recipe "nginx"

template "#{node['nginx']['dir']}/sites-available/default" do
  source "default-site.erb"
  owner "root"
  group "root"
  mode 00644
end

nginx_site 'default' do
  enable true
end