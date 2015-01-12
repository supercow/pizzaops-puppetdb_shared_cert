require 'spec_helper'

describe 'puppetdb_shared_cert' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "puppetdb_shared_cert class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('puppetdb_shared_cert::params') }
        it { should contain_class('puppetdb_shared_cert::install').that_comes_before('puppetdb_shared_cert::config') }
        it { should contain_class('puppetdb_shared_cert::config') }
        it { should contain_class('puppetdb_shared_cert::service').that_subscribes_to('puppetdb_shared_cert::config') }

        it { should contain_service('puppetdb_shared_cert') }
        it { should contain_package('puppetdb_shared_cert').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'puppetdb_shared_cert class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('puppetdb_shared_cert') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
