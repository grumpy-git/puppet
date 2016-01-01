class sethostname {

  exec { "set-hostname":
    command   => '/bin/hostname -F /tmp/host_name',
    onlyif    => "/usr/bin/test -f /tmp/host_name",
  } 

  exec { "set-hostname2":
    command   => '/bin/cat /tmp/host_name > /etc/hostname',
    onlyif    => "/usr/bin/test -f /tmp/host_name",
    require   => Exec['set-hostname']
  } 


  file { "/tmp/host_name": 
    ensure  => absent,
    require => Exec['set-hostname2']
  }


}

