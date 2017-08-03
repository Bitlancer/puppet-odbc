define odbc::datasource (
  $description = undef,
  $driver      = undef,
  $database    = undef,
  $server      = undef,
  $username    = undef,
  $password    = undef,
  $read_only   = undef,
  $trace       = undef
) {

  if !defined(Odbc::Driver[$driver]){
    warning("You have not defined the driver, ${driver}, that this datasource depends on")
  }
  else {
    Odbc::Driver[$driver] -> Augeas["odbc datasource ${name}"]
  }

  $augeas_changes = prefix(
    join_keys_to_values(
      delete_undef_values({
        "Description" => $description,
        "Driver"      => $driver,
        "Database"    => $database,
        "Server"      => $server,
        "UserName"    => $username,
        "Password"    => $password,
        "ReadOnly"    => $read_only,
        "Trace"       => $trace
      }), " "),
  "set ${name}/")

  augeas { "odbc datasource ${name}":
    lens      => 'Odbc.lns',
    incl      => '/etc/odbc.ini',
    changes   => $augeas_changes,
    show_diff => false, # This contains plaintext passwords
  }
}
