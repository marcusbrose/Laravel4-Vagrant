# Enable XDebug ("0" | "1")
$use_xdebug = "0"

# Default path
Exec 
{
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

exec 
{ 
    'apt-get update':
        command => '/usr/bin/apt-get update',
        require => Exec['add php54 apt-repo']
}

include bootstrap
include other
include php54 #specific setup steps for 5.4
include php
include apache
include mysql
include phpmyadmin
include beanstalkd
include redis
include memcached

include laravel_app

include nodejs
include yeoman

# class { 'postgresql::server':
#   config_hash => {
#     'ip_mask_deny_postgres_user' => '0.0.0.0/32',
#     'ip_mask_allow_all_users'    => '0.0.0.0/0',
#     'listen_addresses'           => '*',
#     'manage_redhat_firewall'     => true,
#     'postgres_password'          => 'vagrant',
#   },
# }
# 
# postgresql::db { 'database':
#   user     => 'root',
#   password => 'root'
# }
