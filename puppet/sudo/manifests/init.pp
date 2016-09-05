class sudo {

  package { "sudo":
    ensure => present,
  }

  if $::osfamily == 'Debian' {
        
    file { "/etc/sudoers":
      owner   => "root",
      group   => "root",
      mode    => '0440',
      source  => "puppet://$puppetserver/modules/sudo/sudoers",
      require => Package["sudo"],
     }

  } elsif $::osfamily == 'RedHat' {

        print "This not a supported distro."

  } else {

      print "This is not a supported distro."
  }
 
}
