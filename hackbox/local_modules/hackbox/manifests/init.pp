

class hackbox_base {
  Exec {
    path => ['/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/', '/home/vagrant/bin']
  }

  class { 'stdlib': }
  class { 'apt':    }

  if $::phpversion == '55' {
    apt::source { "dotdeb-common":
      key               => "89DF5277",
      key_source        => "http://www.dotdeb.org/dotdeb.gpg",
      location          => "http://packages.dotdeb.org",
      release           => "wheezy",
      repos             => "all",
      required_packages => "debian-keyring debian-archive-keyring",
      include_src       => true
    }

    apt::source { "dotdeb-php55":
      key               => "89DF5277",
      key_source        => "http://www.dotdeb.org/dotdeb.gpg",
      location          => "http://packages.dotdeb.org",
      release           => "wheezy-php55",
      repos             => "all",
      required_packages => "debian-keyring debian-archive-keyring",
      include_src       => true
    }
  }
}

class hackbox inherits hackbox_base {
  class { 'hackbox::env':          } ->
  class { 'hackbox::phptools':     } ->
  class { 'hackbox::mysql':        } ->
  class { 'hackbox::services':     }
}