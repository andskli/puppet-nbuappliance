require 'spec_helper'

describe 'nbuappliance' do

  let(:facts) {
    {
      :operatingsystem        => 'Sles',
      :operatingsystemrelease => '11.1',
    }
  }

  let(:params) {
    {
      :snmp_enable    => true,
      :snmp_community => 'TEST',
      :snmp_port      => '123',
      :proxy_enable   => true,
      :proxy_server   => 'proxy.domain.com',
      :proxy_port     => '8080',
      :proxy_user     => 'username',
      :proxy_pass     => 'password',
    }
  }

  describe 'callhome' do

    it 'should contain snmp config' do
      should contain_file_line('snmp_enable').with('line'=>'SNMP_ENABLE=1')
      should contain_file_line('snmp_community').with('line'=>'SNMP_COMMUNITY=TEST')
      should contain_file_line('snmp_port').with('line'=>'SNMP_PORT=123')
    end

    it 'should contain proxy config' do
      should contain_file_line('proxy_enable').with('line'=>'PROXY_ENABLED=1')
      should contain_file_line('proxy_server').with('line'=>'PROXY_SERVER=proxy.domain.com')
      should contain_file_line('proxy_port').with('line'=>'PROXY_PORT=8080')
      should contain_file_line('proxy_password').with('line'=>'PROXY_PASSWORD=password')
    end

  end

end

