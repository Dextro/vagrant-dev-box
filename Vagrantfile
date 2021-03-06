# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # This is enabled as requirement for the NFS option for shared folders.
  config.vm.network :hostonly, "192.168.33.10"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 80, 8080 #nginx
  config.vm.forward_port 3306, 8306 #mysql

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  # VM Shared folders are quiet slow. Using NFS will speed up things. This
  # really makes a difference when using a lot of files, e.g. Symfony.
  config.vm.share_folder "v-root", "/vagrant", "." , :nfs => true

  # Enable provisioning with chef solo
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ".cookbooks"
    chef.roles_path = ".roles"
    chef.add_role "web_base"

    chef.json.merge!({
      :dotfiles => {
        :repository => "git://github.com/wijs/dotfiles-server.git",
        :enable_submodules => false,
        :shell => '/bin/bash',
        :install => 'install_unattended.sh'
      }
    })
  end

end
