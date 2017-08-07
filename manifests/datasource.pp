define odbc::datasource (
  $settings = {}
) {

  include ::odbc

  $_driver = $settings['Driver']

  if !defined(Odbc::Driver[$_driver]){
    warning("You have not defined the driver, ${_driver}, that this datasource depends on")
  }
  else {
    Odbc::Driver[$_driver] -> Augeas["odbc datasource ${name}"]
  }

  $augeas_changes = prefix(
    join_keys_to_values(delete_undef_values($settings), ' '),
    "set ${name}/")

  augeas { "odbc datasource ${name}":
    lens      => 'Odbc.lns',
    incl      => '/etc/odbc.ini',
    changes   => $augeas_changes,
    show_diff => false, # This contains plaintext passwords
  }
}
