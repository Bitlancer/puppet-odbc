class odbc::params {

  $package_name   = ['unixODBC', 'unixODBC-libs']
  $package_ensure = 'present'

  $install_devel      = false
  $devel_package_name = 'unixODBC-devel'

}
