Exec {
  path  => join(['/usr/bin', '/usr/sbin', '/bin', '/sbin'], ':')
}

node default {
  exec { "update_timezone":
     command => "echo 'Europe/Berlin' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata",
     unless  => "grep Berlin /etc/timezone",
  }
  
  exec { 'update_hostname':
    command => "echo 'phpughalle-hackbox' > /etc/hostname && service hostname.sh start",
    unless  => "grep 'phpughalle-hackbox' /etc/hostname",
  }

  host { 'phpughalle-hackbox.local':
    ip           => $ipaddress_eth1,
    host_aliases => [ 'phpughalle-hackbox', 'hackbox' ],
    notify       => Exec['update_hostname'],
  }

  package { ['git', 'ant', 'acl', 'curl', 'sudo', 'screen']:
    ensure => latest,
  }
}

