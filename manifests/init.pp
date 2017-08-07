class odbc (
  $datasources        = {},
  $drivers            = {},
  $install_devel      = $::odbc::params::install_devel,
  $devel_package_name = $::odbc::params::devel_package_name,
  $package_name       = $::odbc::params::package_name,
  $package_ensure     = $::odbc::params::package_ensure
) inherits odbc::params {

  include ::odbc::install

  create_resources(odbc::driver, $drivers)
  create_resources(odbc::datasource, $datasources)

  Class[odbc::install]
  -> Odbc::Driver <| |>

  Class[odbc::install]
  -> Odbc::Datasource <| |>

}
