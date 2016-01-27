class toenail {
  
  file { '/usr/local/bin/papply':
    source    => 'puppet:///modules/toenail/papply.sh',
    mode      => '0755',
  }
  
  $systemtype = $::operatingsystem ? {
  'Ubuntu'    => 'debianlike',
  'Debian'    =>  'debianlike',
  'RedHat'   =>  'redhatlike',
  'Fedora'    =>  'redhatlike',
  'CentOS'    =>  'redhatlike',
    default       =>  'unknown',
  }
  notify { "You have a ${systemtype} system": }

  case $::operatingsystem {
    'Ubuntu',
    'Debian': {
       include debianlike    
    }
    'RedHat',
    'Fedora',
    'CentOS': {
      include redhatlike
     }
    default: {
     notify {"I don't know what kind of system you have!":}
    }
  }
}

class debianlike {
  notify { "Special manifest for Debian-like systems": }
}

class redhatlike {
  notify {"Special manifest for rehat-like systems": }
  include lunch
}

class lunch {
  $lunch = 'Burger and fries'
  $lunchtype = $lunch ? {
    /[fF]ries/   => 'unhealthy',
    /salad/ =>  'healthy',
  default     => 'Unknown',
  }
  notify { "Your lunch was ${lunchtype} ":}
}

