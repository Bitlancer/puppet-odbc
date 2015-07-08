# ODBC

# Overview

Configure and manage Unix ODBC settings

## Usage

```puppet

include ::odbc

odbc::driver { 'MySQL'
  package_name      => 'mysql-connector-odbc',
  package_ensure    => '5.1.5r1144',
  override_settings => true,
  description       => 'MySQL 5.1',
  driver            => '/usr/lib64/libmyodbc5.so'
}

odbc::datasource { 'somedb':
  description => 'ODBC access to somedb',
  driver      => 'MySQL 5.1',
  database    => 'somedb',
  servername  => 'localhost',
  username    => 'app_someapp',
  password    => 'asdzdgjz5ua5ya'
  read_only   => true
}

```

# References

## Classes

#### `odbc`

Main class that handles the generic Unix ODBC setup.

## Types

### `odbc::driver`

Define an ODBC driver.

### `odbc::datasource`

Define a system ODBC datasource.

# To Do

* Better documentation ;)
* Tests

