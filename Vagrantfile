Vagrant.configure("2") do |config|
  config.vm.box = "debian/jessie64"
  config.vm.network :private_network, ip: "192.168.55.9"
  config.vm.hostname = "socialengine.local"

  config.vm.define :socialengine do |t|
  end

  config.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--memory", 1024]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "minion.conf"
    salt.run_highstate = true
  end
end
