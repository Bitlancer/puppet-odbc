define odbc::driver (
  $package_name      = undef,
  $package_ensure    = "present",
  $override_settings = false,
  $description       = undef,
  $driver            = undef,
  $setup             = undef,
  $driver64          = undef,
  $setup64           = undef,
  $file_usage        = undef,
  $usage_count       = undef
) {

  include ::odbc

  if $override_settings and $driver == undef and $driver64 == undef {
    fail("You must define driver or driver64")
  }

  package { $package_name:
    ensure => $package_ensure
  }
  
  $augeas_changes = prefix(
    join_keys_to_values(
      delete_undef_values({
        "Description" => $description,
        "Driver"      => $driver,
        "Setup"       => $setup,
        "Driver64"    => $driver64,
        "Setup64"     => $setup64,
        "FileUsage"   => $file_usage,
        "UsageCount"  => $usage_count
      }), " "),
    "set ${name}/")
  
  if $override_settings {
    augeas { "odbc driver ${name}":
      lens    => 'Odbc.lns',
      incl    => '/etc/odbcinst.ini',
      changes => $augeas_changes,
      require => Package[$package_name]
    }
  }
}
