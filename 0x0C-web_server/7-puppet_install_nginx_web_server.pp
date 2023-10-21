# Puppet manifest to install nginx

exec { 'install_nginx':
  provider => shell,
  command  => 'sudo apt-get -y update; sudo apt-get -y install nginx; echo "Hello World!" | sudo tee /var/www/html/index.nginx-debian.html',
}

file_line { 'nginx_redirect_rule':
  path    => '/etc/nginx/sites-available/default',
  line    => 'rewrite ^/redirect_me https://github.com/bmuraya permanent;',
  match   => 'server_name _;',
  ensure  => present,
  require => Exec['install_nginx'],
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure    => 'running',
  enable    => true,
  require   => File_line['nginx_redirect_rule'],
}

exec { 'restart_nginx':
  command  => 'sudo service nginx restart',
  require  => File_line['nginx_redirect_rule'],
}

