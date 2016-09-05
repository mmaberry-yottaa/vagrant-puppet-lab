class profiles {


  file { "/etc/profile.d/git_bash_prompt.sh":
    owner   => "root",
    group   => "root",
    mode    => '0750',
    source  => "puppet://$puppetserver/modules/profiles/git_bash_prompt.sh",
   
  }

}
