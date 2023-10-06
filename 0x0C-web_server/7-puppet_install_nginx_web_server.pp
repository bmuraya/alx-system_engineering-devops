# Puppet manifest to install nginx

exec {'install':
  provider => shell,
  command  => 'sudo apt-get -y update; sudo apt-get -y install nginx;\
  echo "Hello World!" | sudo tee /var/www/html/index.nginx-debian.html;\
  "s/server_name _;server_name _;\n\trewrite ^\/redirect_me https:\/\/github.com\/bmuraya permanent;/" /etc/nginx/sites-available/default;\
  sudo service nginx start',
}
