require 'spec_helper'

describe 'odbc::datasource', :type => :define do
  let(:facts) {{ :osfamily => 'RedHat' }}
  let(:title) { 'test' }
  let(:params) do
    {
      'settings' => {
        'Database'    => 'somedb',
        'Description' => 'ODBC access to somedb',
        'Driver'      => 'MySQL 5.1',
        'Password'    => 'asfteyataadsfa',
        'ReadOnly'    => true,
        'Server'      => 'localhost',
        'UserName'    => 'odbc'
      }
    }
  end

  it {
    should contain_class('odbc')
  }

  it {
    should contain_augeas('odbc datasource test').with(
      'incl'      => '/etc/odbc.ini',
      'changes'   => [
        'set test/Database somedb',
        'set test/Description ODBC access to somedb',
        'set test/Driver MySQL 5.1',
        'set test/Password asfteyataadsfa',
        'set test/ReadOnly true',
        'set test/Server localhost',
        'set test/UserName odbc'
      ],
      'show_diff' => false
    )
  }
end
