class hackbox::phptools {

  package { [
    'php5',
    'php5-curl',
    'php5-intl',
    'php5-xdebug',
    'php5-gd',
    'php5-xsl',
    'php5-mysql',
    'imagemagick',
    'php5-imagick',
    'apache2-mpm-prefork',
    'libapache2-mod-php5',
    'phpmyadmin',
  ]: ensure => latest }

  file { '/home/vagrant/bin':
    ensure => directory,
    owner  => 'vagrant',
    group  => 'vagrant',
  } ->
  wget::fetch { 'composer':
    source      => 'http://getcomposer.org/composer.phar',
    destination => '/home/vagrant/bin/composer',
    execuser    => 'vagrant',
  } ->
  file { '/home/vagrant/bin/composer':
    mode => '0744',
  } ->
  wget::fetch { 'phpunit':
    source      => 'https://phar.phpunit.de/phpunit.phar',
    destination => '/home/vagrant/bin/phpunit',
    execuser    => 'vagrant',
  } ->
  file { '/home/vagrant/bin/phpunit':
    mode => '0744',
  } 
  file { 'phpinfo':
    ensure  => present,
    path    => '/var/www/phpinfo.php',
    content => "<?php \nphpinfo(); \n",
    require => Package['apache2-mpm-prefork'],
  }

  exec {'apache2-reload':
    command => '/usr/sbin/service apache2 reload',
    require => Package['apache2-mpm-prefork'],
  }

  file { '/etc/apache2/conf.d/phpmyadmin.conf':
    ensure  => 'link',
    group   => '0',
    mode    => '777',
    owner   => '0',
    target  => '/etc/phpmyadmin/apache.conf',
    require => Package['phpmyadmin'],
    notify  => Exec['apache2-reload'],
  }

}

