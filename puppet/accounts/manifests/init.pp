class accounts {

	include groups
	include sudo         
  	include ssh

    
  	if $::osfamily == 'Debian' {
        
        $sudogroup ='sudo'
        $admingroup = 'admin'

  	} elsif $::osfamily == 'RedHat' {

        print "This not a supported distro."

 	} else {

    	print "This is not a supported distro."
  	}
	
	user { "dev" :
		ensure => present, #or absent to remove the user
		home => '/home/dev',
		shell => '/bin/bash',
		managehome => true,
		gid => 'dev',
		groups => [$sudogroup,$admingroup],
		#openssl passwd -1
		password => '$1$bzH.aCZ4$G7L8h2tLDSjZle.Wxecw61',
	}

	ssh_authorized_key { 'dev-key':
   		ensure => present, #or absent to remove the user 
    	user => 'dev',
    	type => 'rsa',
    	key => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDJJCcGLJL2KljHQ3Qp4dfYpgrKl/AtLX97q3BbLUuxlicb1tW4ttUFHt5v7ISA/IkP1bEW04Ul136yPYxh2AbXh9i4lNFElSaY26FrkTFyfiehCiLKwGsFwPr8jGd5eAPUfFlipG4EszzWFj+ZPZe6/Xi1BebrY4DCESuKv/bEb1/XsPzVoPvX7DVmr+zSUhaHQJKhA1dG17t1pVcRw9JLvZaPLf5+wrXUKdj3AMvDzBZKxYzKMBRviNfTecGsJRNNZAbFn0sdY9JDKviTmALp2B7nDP7JOV1Z7zubtxYB9zL7vHo8f3v8OH3tBChrPqucvybB8XspPu1dPGS48XLa3W6dWwNrK5uhXC2JAZllZ8J/0ypLFGjgmyFnaF4w+10tYYaKKzX2EgVTGjUNDHmehGYpNO9KElu1uLkiBTQ3X3Da8gXeSr0SVMa8ym3xcAt3BIvZmUcV3lOXrkZmBv4RE0C9UrNeJm/aiN1teT4+3/EDN74Wv5ElKGkPS4BZbfCFx6k0gP36AUipfXWbu1J+FcYJXT7iwCyO8go23F0PNjZLlIpLNUYWvZyaunuGhUTqXxdjE0+7KByypBQAxEc6rGI1TFdYAJhLoqTw50v+SL27cTzSKLlUYZjVABx3CGqM8KKp3bPE8haT37lbsXTBvZCcmIChrr0o1IEgyvTpEQ=='
	}

	
}


