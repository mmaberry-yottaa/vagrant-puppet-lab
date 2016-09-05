Vagrant.configure('2') do |config|

  config.vm.define :puppetmaster do |node|
    node.vm.box = "ubuntu/trusty64"
    node.vm.host_name = "puppetmaster.dev.myhobbybazaar.int"
    node.vm.network :private_network, :ip => '10.20.1.2'
    node.vm.synced_folder "puppet/", "/puppet"
    node.vm.provision :hosts, :sync_hosts => true

  end

  config.vm.define :www do |node|
    node.vm.box = "ubuntu/trusty64"
    node.vm.host_name = "www.dev.myhobbybazaar.int"
    node.vm.network :private_network, :ip => '10.20.1.3'
    node.vm.network "forwarded_port", guest: 80, host: 8080
    node.vm.synced_folder "html/", "/var/www/html/www.dev.myhobbybazaar.int/public_html"
  end
end