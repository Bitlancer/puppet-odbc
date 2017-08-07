require 'spec_helper'

describe 'odbc::driver', :type => :define do
  let(:facts) {{ :osfamily => 'RedHat' }}
  let(:title) { 'mysql' }
  let(:params) do
    {
      'package_name'      => 'mysql-connector-odbc',
      'package_ensure'    => '5.1.5r1144',
      'override_settings' => true,
      'description'       => 'MySQL 5.1',
      'driver'            => '/usr/lib64/libmyodbc5.so'
    }
  end

  it {
    should contain_class('odbc')
  }

  it {
    should contain_package('mysql-connector-odbc').with(
      'ensure' => '5.1.5r1144'
    )
  }

  it {
    should contain_augeas('odbc driver mysql').with(
      'incl'      => '/etc/odbcinst.ini',
      'changes'   => [
        'set mysql/Description MySQL 5.1',
        'set mysql/Driver /usr/lib64/libmyodbc5.so'
      ]
    )
  }
end
