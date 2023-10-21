<<<<<<< HEAD
#!/usr/bin/env bash
# dOCS

package { 'nginx':
  ensure => installed,
}

file_line { 'aaaaa':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
=======
#setup nginx

package {
    'nginx':
    ensure => installed,
}

file {'/var/www/html/index.nginx-debian.html':
    content => 'Hello World!',
>>>>>>> 765cb20a48db790a21faefb592e1fec3d307b0a5
}

file_line {'configure redirection':
    path  =>  '/etc/nginx/sites-available/default',
    after =>  'server_name _;',
    line  =>  "\n\tlocation /redirect_me {\n\t\treturn 301 https://youtu.be/dQw4w9WgXcQ;\n\t}\n",
}

service {'nginx':
    ensure => running,
}