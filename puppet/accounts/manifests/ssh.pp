class accounts::ssh {
        

	if $::osfamily == 'Debian' {
        
        $sshname ='ssh'

  	} elsif $::osfamily == 'RedHat' {

        print "This not a supported distro."

  	} else {

    	print "This is not a supported distro."
  	}
	

  file { '/etc/ssh/sshd_config':
    ensure  => present,
    source  => 'puppet:///modules/accounts/sshd_config',
    notify  => Service["$sshname"],
  }
        
  service { "$sshname":
    hasrestart  => true,
  }
}
