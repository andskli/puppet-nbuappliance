require 'spec_helper'

describe 'nbuappliance' do

  describe 'check all file paths exist' do
    it { should contain_file('size_data_buffers').with_path('/usr/openv/netbackup/db/config/SIZE_DATA_BUFFERS') }
    it { should contain_file('number_data_buffers').with_path('/usr/openv/netbackup/db/config/NUMBER_DATA_BUFFERS') }
    it { should contain_file('size_data_buffers_disk').with_path('/usr/openv/netbackup/db/config/SIZE_DATA_BUFFERS_DISK') }
    it { should contain_file('size_data_buffers_ft').with_path('/usr/openv/netbackup/db/config/SIZE_DATA_BUFFERS_FT') }
    it { should contain_file('number_data_buffers_ft').with_path('/usr/openv/netbackup/db/config/NUMBER_DATA_BUFFERS_FT') }
    it { should contain_file('cd_number_data_buffers').with_path('/usr/openv/netbackup/db/config/CD_NUMBER_DATA_BUFFERS') }
    it { should contain_file('cd_size_data_buffers').with_path('/usr/openv/netbackup/db/config/CD_SIZE_DATA_BUFFERS') }
    it { should contain_file('cd_whole_image_copy').with_path('/usr/openv/netbackup/db/config/CD_WHOLE_IMAGE_COPY') }
    it { should contain_file('cd_update_interval').with_path('/usr/openv/netbackup/db/config/CD_UPDATE_INTERVAL') }
    it { should contain_file('ost_cd_busy_retry_limit').with_path('/usr/openv/netbackup/db/config/OST_CD_BUSY_RETRY_LIMIT') }
    it { should contain_file('net_buffer_sz').with_path('/usr/openv/netbackup/NET_BUFFER_SZ') }
    it { should contain_file('net_buffer_sz_rest').with_path('/usr/openv/netbackup/NET_BUFFER_SZ_REST') }
  end

  describe 'cdwholeimagecopy file' do
    let(:params) { {:cdwholeimagecopy => false} }
    it { should_not contain_file('cd_whole_image_copy').with_ensure('absent') }
  end

  describe 'alter buffer values' do
    let(:params) {
      { :sizedatabuffers => 100,
        :numberdatabuffers => 25,
      }}

    it { should contain_file('size_data_buffers').with_content('100') }
    it { should contain_file('number_data_buffers').with_content('25') }
  end

end
