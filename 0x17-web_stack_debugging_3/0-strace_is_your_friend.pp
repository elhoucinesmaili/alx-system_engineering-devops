# A Puppet script to replace occurrences of "phpp" with "php" in a file on the server

$file_to_edit = '/var/www/html/wp-settings.php'

# Replace any instance of "phpp" with "php" in the specified file

exec { 'replace_line':
  command => "sed -i 's/phpp/php/g' ${file_to_edit}",
  path    => ['/bin','/usr/bin']
}
