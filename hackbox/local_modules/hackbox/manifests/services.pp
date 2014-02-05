class hackbox::services {

    exec {'enable-php5-module':
      command => 'a2enmod php5 1>/dev/null && service apache2 restart',
      require => Package['apache2-mpm-prefork'],
    }

}