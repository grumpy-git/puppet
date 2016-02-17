class motd (
  $dynamic_motd = true,
  $template = undef,
  $content = undef, ) {
   
  if $template {
    if $content {
      warning('Both $template and $content parameters passed to motd, ignoring content')
    }
    $motd_content = template($template)
  } elsif $content {
    $motd_content = $content
  } else {
    $motd_content = template('motd/motd.erb')
  }
  
  if $::kernel == 'Linux' {
    file { '/etc/motd' :
      ensure    => file,
      backup    =>  false,
      content   =>  $motd_content,
    }
    if ($::osfamily == 'Debian' ) and ($dynamic_motd == false ) {
      file_line { 'dynamic_motd' :
        ensure    =>  absent,
        path        =>  '/etc/pam.d/sshd',
        line         => 'session    optional    pam_motd.so   motd=/run/motd.dynamic  noupdate',
      }
    }
  }
  
  
  
}