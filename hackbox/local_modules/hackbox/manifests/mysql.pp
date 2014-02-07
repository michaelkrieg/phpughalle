class hackbox::mysql {

  class {'::mysql::server': } ->
  mysql::db { 'hackbox':
    user     => 'phpug',
    password => 'changeme',
    host     => 'localhost',
    grant    => ['ALL'],
  }
  
}