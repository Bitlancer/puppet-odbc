class odbc::install {

  package { $odbc::package_name:
    ensure => $odbc::package_ensure
  }

}
