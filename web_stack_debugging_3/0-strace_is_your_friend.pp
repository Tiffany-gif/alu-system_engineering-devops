#Puppet Script
$file = '/var/www/html/wp-settings.php'

exec{ 'fix-wordpress':
  command => "sed -i 's/phpp/php/g' ${file}",
  path    => ['/bin', '/usr/bin'],
  onlyif  => "grep -q phpp ${file}",
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure => running,
  enable => true,
}

