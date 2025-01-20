}
tom_http_response_header.pp
# Configures Nginx to include a custom HTTP header (X-Served-By) with the hostname

# Ensure Nginx is installed and running
package { 'nginx':
  ensure => installed,
}

# Ensure the Nginx service is enabled and running
service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => Package['nginx'],
}

# Configure Nginx to include the custom header
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/default.erb'),
  notify  => Service['nginx'],
  require => Package['nginx'],
}

# Create the template for the Nginx configuration
file { '/etc/puppetlabs/code/environments/production/modules/nginx/templates/default.erb':
  ensure  => file,
  content => @("EOF")
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        add_header X-Served-By "<%= @hostname %>";
        try_files \$uri \$uri/ =404;
    }
}
| EOF
}

# Reload Nginx to apply changes
exec { 'reload-nginx':
  command     => '/usr/sbin/nginx -s reload',
  refreshonly => true,
  subscribe   => File['/etc/nginx/sites-available/default'],
}
