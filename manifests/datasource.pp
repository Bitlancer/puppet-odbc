define odbc::datasource (
  $description = undef,
  $driver      = undef,
  $database    = undef,
  $server      = undef,
  $username    = undef,
  $password    = undef,
  $read_only   = undef,
  $trace       = undef,
  $is_oracle   = undef,
) {

  if !defined(Odbc::Driver[$driver]){
    warning("You have not defined the driver, ${driver}, that this datasource depends on")
  }
  else {
    Odbc::Driver[$driver] -> Augeas["odbc datasource ${name}"]
  }

  $_settings_base = {
    "Description" => $description,
    "Driver"      => $driver,
    "Database"    => $database,
    "Password"    => $password,
    "ReadOnly"    => $read_only,
    "Trace"       => $trace
  }

  if $is_oracle or ($is_oracle == undef and $driver =~ /(?i:oracle)/) {
    $_settings = $_settings_base + {
      "ServerName" => $server,
      "UserID"     => $username,
    }
  } else {
    $_settings = $_settings_base + {
      "Server"      => $server,
      "UserName"    => $username,
    }
  }

  $augeas_changes = prefix(
    join_keys_to_values(delete_undef_values($_settings), " "),
    "set ${name}/")

  augeas { "odbc datasource ${name}":
    lens      => 'Odbc.lns',
    incl      => '/etc/odbc.ini',
    changes   => $augeas_changes,
    show_diff => false, # This contains plaintext passwords
  }
}
