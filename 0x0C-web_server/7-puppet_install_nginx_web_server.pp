# Update the system package list
exec { 'update_system':
  command => '/usr/bin/apt-get update',
}

# Install Nginx package
package { 'nginx':
  ensure  => 'present',
  require => Exec['update_system'],
}

# Configure custom index.html file
file { '/var/www/html/index.html':
  ensure  => 'file',
  content => 'Hello World!',
  require => Package['nginx'],
}

# Add a custom redirection rule
exec { 'add_redirect_rule':
  command => 'sed -i "24i\\tlocation /redirect_me { return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4; }" /etc/nginx/sites-available/default',
  path    => ['/bin', '/usr/bin'],
  require => Package['nginx'],
}

# Ensure Nginx service is running
service { 'nginx':
  ensure    => 'running',
  enable    => true,
  require   => [Package['nginx'], Exec['add_redirect_rule']],
}

