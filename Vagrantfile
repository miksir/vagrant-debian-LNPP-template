Vagrant.configure(2) do |config|
  config.vm.box = "debian/contrib-jessie64"
  config.vm.define "test" do |test|
  end
  config.vm.hostname = "test"
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
    v.memory = 1024
    v.cpus = 2
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end
  config.vm.synced_folder ".", "/home/vagrant/project", type: "virtualbox"
  config.vm.provision "symlink", type: "shell", inline: "sh ~/project/vagrantup/symlinkcheck.sh", privileged: false, run: "always"
  config.vm.provision "ansible", type: "shell", inline: "sh ~/project/vagrantup/ansible_install.sh", privileged: false
  config.vm.provision "main",    type: "shell", inline: "sh ~/project/vagrantup/ansible_provisioning.sh provisioning", privileged: false
  config.vm.provision "update",  type: "shell", inline: "sh ~/project/vagrantup/ansible_provisioning.sh update", privileged: false, run: "never"
  config.vm.provision "startup", type: "shell", inline: "sh ~/project/vagrantup/ansible_provisioning.sh startup", privileged: false, run: "always"
end
