box = "bento/ubuntu-16.04"

Vagrant.configure("2") do |config|
    config.vm.box = box
    config.vm.provider "virtualbox" do |v|
      v.gui = true
      v.cpus = 4
      v.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
      v.customize ["modifyvm", :id, "--memory", "4096"]
      v.customize ["modifyvm", :id, "--vram", "16"]
      v.customize ["modifyvm", :id, "--nic2", "hostonly", "--nictype2", "82540EM", "--cableconnected2", "on", "--hostonlyadapter2", "vboxnet0"]
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    end

  config.vm.define "vb-01" do |config|
    config.vm.host_name = "oradb"
    config.vm.network "forwarded_port", id: 'ssh', guest: 22, host: 2222
#   config.vm.provision "shell", inline: "apt-get install curl"
    config.vm.provision "shell",
      inline: "curl https://raw.githubusercontent.com/rudibroekhuizen/puppet-role_base/master/files/bootstrap.sh > bootstrap.sh; chmod +x bootstrap.sh;./bootstrap.sh"
  end
end
