# Ensure system package index is up-to-date
exec { 'update_system':
  command => '/usr/bin/apt-get update',
}

# Install Nginx package
package { 'nginx':
  ensure  => installed,
  require => Exec['update_system'],
}

# Create a simple HTML file
file { '/var/www/html/index.html':
  content => "<html>
  <head><title>Welcome</title></head>
  <body>
    <h1>Hello, Ubuntu Server!</h1>
  </body>
</html>",
  require => Package['nginx'],
}

# Add redirect configuration in Nginx
file_line { 'add_redirect_to_nginx':
  path  => '/etc/nginx/sites-available/default',
  line  => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=dQw4w9WgXcQ permanent;',
  match => 'location / {',
  after => 'location / {',
  require => Package['nginx'],
}

# Ensure Nginx service is running and apply changes
service { 'nginx':
  ensure     => running,
  enable     => true,
  subscribe  => File['/etc/nginx/sites-available/default'],
}

