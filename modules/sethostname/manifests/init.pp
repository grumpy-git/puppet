class sethostname {
  file { "/etc/hostname":
    ensure   => present,
    owner    => root,
    group    => root,
    mode     => '0644',
    content  => "$::hostname\n",
    notify   => Exec["set-hostname"],
  }
  exec { "set-hostname":
    command   => '/bin/hostname -F /tmp/host_name',
    onlyif    => "/usr/bin/test -f /tmp/host_name",
  } 

  file { "/tmp/host_name": 
    ensure  => absent,
    require => Exec["set-hostname"],
  }
}

