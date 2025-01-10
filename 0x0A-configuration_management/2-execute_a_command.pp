exec { 'terminate_process':
  command => 'pkill -9 -f killmenow',
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  onlyif  => 'pgrep -f killmenow',
}
