node 'cookbook' {
  include puppet   
}

node 'cookbook2' {
  include puppet

  user { 'billy': ensure => 'present', }
  user { 'sammy': ensure => 'present', }
}
  
