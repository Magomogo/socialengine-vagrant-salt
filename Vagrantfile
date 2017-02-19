Vagrant.configure("2") do |config|
  config.vm.box = "dj"
  config.vm.box_url = "http://repos.xiag.ch/xiag/debian-jessie-amd64.box"
  config.vm.network :forwarded_port, guest: 443, host: 4431, auto_correct: true
  config.vm.network :forwarded_port, guest: 80, host: 8002, auto_correct: true
  config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true
  config.vm.network :private_network, ip: "192.168.55.9"
  config.vm.hostname = "socialengine.local"
  config.hostsupdater.aliases = [
    "socialengine.local",
  ]

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
