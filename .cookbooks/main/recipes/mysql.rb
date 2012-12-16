# mysql
include_recipe "openssl"
include_recipe "mysql::server"
include_recipe "mysql_charset"

# give root access from anywhere (DEVELOPMENT ONLY)
execute "mysql-root-privileges" do
  command "mysql -uroot -p#{node["mysql"]["server_root_password"]} -e \"GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '#{node["mysql"]["server_root_password"]}' WITH GRANT OPTION;\""
end

# create database vagrant
execute "mysql-create-db-vagrant" do
  command "mysql -uroot -p#{node["mysql"]["server_root_password"]} -e \"CREATE DATABASE IF NOT EXISTS vagrant;\""
end


# create user vagrant with password vagrant and grant all privileges to the database vagrant
execute "mysql-grant-privileges" do
     command "mysql -uroot -p#{node["mysql"]["server_root_password"]} -e \"GRANT ALL ON vagrant.* TO 'vagrant'@'%' IDENTIFIED BY 'vagrant';\"" 
end

# flush privileges
execute "mysql-flush-privileges" do
  command "mysql -uroot -p#{node["mysql"]["server_root_password"]} -e \"FLUSH PRIVILEGES;\""
end
