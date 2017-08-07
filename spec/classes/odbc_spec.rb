require 'spec_helper'

describe 'odbc', :type => :class do

  let(:facts) {{:osfamily => 'RedHat'}}

  context 'with defaults' do
    it {
      should contain_class('odbc')
    }

    %w(unixODBC).each do |package|
      it {
        should contain_package(package).with({
          'ensure' => 'present'
        })
      }
    end
  end
end
