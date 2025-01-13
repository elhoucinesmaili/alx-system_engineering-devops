# Puppet manifest to configure the /etc/ssh/ssh_config file
# Ensures password authentication is disabled and an identity file is declared

file_line { 'Turn off passwd auth':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
}

file_line { 'Declare identity file':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
}
