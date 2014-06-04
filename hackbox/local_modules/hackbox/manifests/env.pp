class hackbox::env {

  exec { "update_timezone":
     command => "echo 'Europe/Berlin' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata",
     unless  => "grep Berlin /etc/timezone",
  }
  
  exec { 'update_hostname':
    command => "echo 'phpughalle-hackbox' > /etc/hostname && service hostname.sh start",
    unless  => "grep 'phpughalle-hackbox' /etc/hostname",
  }


   case $::phpversion {
      '54':    { $localhostname = "phpughalle-hackbox-54.local" }
      '55':    { $localhostname = "phpughalle-hackbox-55.local" }
      default: { $localhostname = "phpughalle-hackbox.local" }

    }

  host { $localhostname:
    ip           => $ipaddress_eth1,
    host_aliases => [ 'phpughalle-hackbox', 'hackbox' ],
    notify       => Exec['update_hostname'],
  }

  package { ['git', 'ant', 'acl', 'curl', 'sudo', 'screen', 'vim', 'zip']:
    ensure => latest,
  }

}
