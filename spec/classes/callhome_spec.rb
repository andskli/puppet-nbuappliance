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
      :snmp_enable     => true,
      :snmp_community  => 'TEST',
      :snmp_port       => '123',
      :proxy_enable    => true,
      :proxy_server    => 'proxy.domain.com',
      :proxy_port      => '8080',
      :proxy_user      => 'username',
      :proxy_pass      => 'password',
      :ch_contact      => 'Bart Simpson',
      :ch_contactemail => 'bart@springfield.org',
      :ch_address      => '742 Evergreen Terrace',
      :ch_city         => 'Springfield',
      :ch_zip          => '12345',
      :ch_state        => 'Massachusetts',
      :ch_country      => 'US',
      :ch_companyname  => 'Springfield Elementary School',
      :ch_phone        => '0123456789',
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

    it 'should contain callhome config' do
      should contain_file_line('ch_contact').with('line'=>'CONTACT=Bart Simpson')
      should contain_file_line('ch_contactemail').with('line'=>'CONTEMAIL=bart@springfield.org')
      should contain_file_line('ch_address').with('line'=>'ADDRESS=742 Evergreen Terrace')
      should contain_file_line('ch_city').with('line'=>'CITY=Springfield')
      should contain_file_line('ch_zip').with('line'=>'ZIP=12345')
      should contain_file_line('ch_state').with('line'=>'STATE=Massachusetts')
      should contain_file_line('ch_country').with('line'=>'COUNTRY=US')
      should contain_file_line('ch_companyname').with('line'=>'COMPANYNAME=Springfield Elementary School')
      should contain_file_line('ch_phone').with('line'=>'PHONE=0123456789')
    end

  end

end

