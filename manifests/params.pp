class odbc::params {

  $package_name   = 'unixODBC'
  $package_ensure = 'present'

  $install_devel      = false
  $devel_package_name = "${package_name}-devel"

}
