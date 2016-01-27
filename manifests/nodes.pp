
node 'toenail.gnrs.co.uk' {
  include toenail
}

node 'cookbook' {
  include puppet   
}

node 'cookbook2' {
  include puppet
  include memcached
  include apache

  user { 'billy': ensure => 'present', }
  user { 'sammy': ensure => 'present', }
  user { 'willy': ensure => 'present', }
  user { 'archie': ensure => 'present', }
}

node 'cookbook3' {
  include puppet   
}


node 'default' {
  include sethostname
}

node 'heartbeat1' {
  include puppet
}

node 'heartbeat2' {
  
}
