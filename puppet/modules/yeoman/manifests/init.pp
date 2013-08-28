class yeoman {
  $yeomanPackages = [ "git", "rubygems", "libjpeg-turbo-progs", "optipng", "phantomjs" ]
  package { $yeomanPackages:
    ensure => "installed",
    require => Exec['apt-get update'],
  }
  package { 'compass':
    ensure   => latest,
    provider => 'gem',
    require  =>  Package["rubygems"],
  }
  package { 'yo':
    ensure => present,
    provider => 'npm',
    require => [Class["nodejs"]],
  }
  package { 'grunt-cli':
    ensure => present,
    provider => 'npm',
    require => [Class["nodejs"]],
  }
  package { 'bower':
    ensure => present,
    provider => 'npm',
    require => [Class["nodejs"]],
  }
  exec {
    'checking yeoman':
    command => "curl -L get.yeoman.io | bash",
    require => [Class["nodejs"], Class['other']],
  }
}