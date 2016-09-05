# vagrant-puppet-lab

* git clone https://github.com/mikemaberry/vagrant-puppet-lab.git
* cd vagrant-puppet-lab
* vagrant plugin install vagrant-hostsupdater (https://github.com/cogitatio/vagrant-hostsupdater) 
* vagrant plugin install vagrant-hosts (https://github.com/oscar-stack/vagrant-hosts)
* vagrant up

# Set Up the PuppetMaster 
* vagrant ssh puppetmaster
* wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb 
* dpkg -i puppetlabs-release-trusty.deb
* apt-get update
* apt-get install puppetmaster-passenger
* puppet resource package puppetmaster ensure=latest
* edit /etc/puppet/puppet.conf
  - dns_alt_names = puppet,puppet.example.com 
  - comment out templatedir=$confdir/templates
* service puppetmaster start

# Set Up the PuppetNode
* puppet agent is already installed 
* edit /etc/puppet/puppet.conf to point to the puppetmaster 
  - server= puppetmaster.example.com 
 * puppet agent -t
 * Sign the cert on the puppet master
   - puppet cert sign hostname.example.com
 * puppet agent -t on the agent again
