require 'spec_helper'

describe 'nbuappliance' do

  describe 'check all files exists' do
    it { should contain_file('size_data_buffers') }
    it { should contain_file('number_data_buffers') }
    it { should contain_file('size_data_buffers_disk') }
    it { should contain_file('size_data_buffers_ft') }
    it { should contain_file('number_data_buffers_ft') }
    it { should contain_file('cd_number_data_buffers') }
    it { should contain_file('cd_size_data_buffers') }
    it { should contain_file('cd_whole_image_copy') }
    it { should contain_file('cd_update_interval') }
    it { should contain_file('ost_cd_busy_retry_limit') }
    it { should contain_file('net_buffer_sz') } 
    it { should contain_file('net_buffer_sz_rest') }
  end

  describe 'ensure cdwholeimagecopy false' do
    let(:params) { {:cdwholeimagecopy => false} }
    it { should_not contain_file('cd_whole_image_copy').with_ensure('absent') }
  end

end
