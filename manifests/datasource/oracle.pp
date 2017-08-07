define odbc::datasource::oracle (
  $description = undef,
  $driver      = undef,
  $database    = undef,
  $server      = undef,
  $username    = undef,
  $password    = undef,
  $read_only   = undef,
  $trace       = undef
) {

  $_settings = {
    'ServerName'  => $server,
    'UserID'      => $username,
    'Description' => $description,
    'Driver'      => $driver,
    'Database'    => $database,
    'Password'    => $password,
    'ReadOnly'    => $read_only,
    'Trace'       => $trace
  }

  odbc::datasource { $name:
    settings => $_settings
  }
}
