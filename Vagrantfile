Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "vagrant-ubuntu-php7-template"
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.network "forwarded_port", guest: 5432, host: 54322
  config.vm.provider "virtualbox" do |v|
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"]
  end
  config.vm.provision "shell", inline: "/vagrant/vagrantup/ansible_install.sh", privileged: true
  config.vm.provision "shell", inline: "PYTHONUNBUFFERED=1 ansible-playbook /vagrant/vagrantup/provisioning.yml", privileged: false, run: "always"
end
