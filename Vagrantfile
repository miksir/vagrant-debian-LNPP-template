Vagrant.configure(2) do |config|
  config.vm.box = "debian/contrib-jessie64"
  config.vm.hostname = "test"
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "forwarded_port", guest: 5432, host: 54320
  config.vm.network "forwarded_port", guest: 9200, host: 19200
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end
  config.vm.synced_folder ".", "/home/vagrant/project", type: "virtualbox"
  config.vm.provision "shell", inline: "sh ~/project/vagrantup/symlinkcheck.sh", privileged: false, run: "always"
  config.vm.provision "shell", inline: "sh ~/project/vagrantup/ansible_install.sh", privileged: false
  config.vm.provision "shell", inline: "sh ~/project/vagrantup/ansible_provisioning.sh", privileged: false
  config.vm.provision "shell", inline: "PYTHONUNBUFFERED=1 ansible-playbook ~/project/vagrantup/startup.yml --tags=untagged", privileged: false, run: "always"
end
