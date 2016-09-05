class common {

  package { "git":
    ensure => present,
  }

  #if statement for later commons.... 

  if $::osfamily == 'Debian' {
        

  } elsif $::osfamily == 'RedHat' {

        print "This not a supported distro."

  } else {

      print "This is not a supported distro."
  }
 
}