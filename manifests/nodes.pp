node 'cookbook' {
  include puppet   
}

node 'cookbook2' {
  include puppet

  user { 'billy': ensure => 'present', }
  user { 'sammy': ensure => 'present', }
  user { 'willy': ensure => 'present', }
  user { 'archie': ensure => 'present', }
}

node 'cookbook3' {
  include puppet   
}
  
