#Puppet Script
$file = '/var/www/html/wp-settings.php'

exec{ 'fix-wordpress':
  command => "sed -i 's/phpp/php/g' ${file}",
  path    => ['/bin', '/usr/bin'],
  onlyif  => "grep -q phpp ${file}",
  notify  => Service['apache2'],
}

service { 'apache2':
  ensure => running,
  enable => true,
}

