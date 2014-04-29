require 'spec_helper'

describe 'nbuappliance' do

  describe 'check defaults' do
    let(:facts) {{:operatingsystem => 'Sles', :operatingsystemrelease => '11.1' }}

    it { should contain_file('size_data_buffers').with_path('/usr/openv/netbackup/db/config/SIZE_DATA_BUFFERS') }
    it { should contain_file('number_data_buffers').with_path('/usr/openv/netbackup/db/config/NUMBER_DATA_BUFFERS') }
    it { should contain_file('size_data_buffers_disk').with_path('/usr/openv/netbackup/db/config/SIZE_DATA_BUFFERS_DISK') }
    it { should contain_file('number_data_buffers_disk').with_path('/usr/openv/netbackup/db/config/NUMBER_DATA_BUFFERS_DISK') }
    it { should contain_file('size_data_buffers_ft').with_path('/usr/openv/netbackup/db/config/SIZE_DATA_BUFFERS_FT') }
    it { should contain_file('number_data_buffers_ft').with_path('/usr/openv/netbackup/db/config/NUMBER_DATA_BUFFERS_FT') }
    it { should contain_file('cd_number_data_buffers').with_path('/usr/openv/netbackup/db/config/CD_NUMBER_DATA_BUFFERS') }
    it { should contain_file('cd_size_data_buffers').with_path('/usr/openv/netbackup/db/config/CD_SIZE_DATA_BUFFERS') }
    it { should contain_file('cd_whole_image_copy').\
         with_path('/usr/openv/netbackup/db/config/CD_WHOLE_IMAGE_COPY').\
         with_ensure('present')
    }
    it { should contain_file('cd_update_interval').with_path('/usr/openv/netbackup/db/config/CD_UPDATE_INTERVAL') }
    it { should contain_file('ost_cd_busy_retry_limit').with_path('/usr/openv/netbackup/db/config/OST_CD_BUSY_RETRY_LIMIT') }
    it { should contain_file('net_buffer_sz').with_path('/usr/openv/netbackup/NET_BUFFER_SZ') }
    it { should contain_file('net_buffer_sz_rest').with_path('/usr/openv/netbackup/NET_BUFFER_SZ_REST') }
    it { should contain_file('dps_proxydefaultrecvtmo').with_path('/usr/openv/netbackup/db/config/DPS_PROXYDEFAULTRECVTMO') }
    it { should contain_file('dps_proxydefaultsendtmo').with_path('/usr/openv/netbackup/db/config/DPS_PROXYDEFAULTSENDTMO') }
    it { should contain_file('dps_proxynoexpire').with_path('/usr/openv/netbackup/db/config/DPS_PROXYNOEXPIRE') }
    it { should contain_file('max_entries_per_add').with_path('/usr/openv/netbackup/db/config/MAX_ENTRIES_PER_ADD') }
    it { should contain_file('parent_delay').with_path('/usr/openv/netbackup/db/config/PARENT_DELAY') }
    it { should contain_file('child_delay').with_path('/usr/openv/netbackup/db/config/CHILD_DELAY') }
  end

  describe 'cdwholeimagecopy false' do
    let(:params) { {:cdwholeimagecopy => false} }
    let(:facts) {
      {
        :operatingsystem        => 'Sles',
        :operatingsystemrelease => '11.1'
      }
    }
    it { should contain_file('cd_whole_image_copy').with_ensure('absent') }
  end

  describe 'cdwholeimagecopy true' do
    let(:params) { {:cdwholeimagecopy => true} }
    let(:facts) {
      {
        :operatingsystem        => 'Sles',
        :operatingsystemrelease => '11.1'
      }
    }
    it { should contain_file('cd_whole_image_copy').with_ensure('present') }
  end

  describe 'dpsproxynoexpire false' do
    let(:params) { {:dpsproxynoexpire => false} }
    let(:facts) {
      {
        :operatingsystem        => 'Sles',
        :operatingsystemrelease => '11.1'
      }
    }
    it { should contain_file('dps_proxynoexpire').with_ensure('absent') }
  end

  describe 'dpsproxynoexpire true' do
    let(:prams) { {:dpsproxynoexpire => false} }
    let(:facts) {
      {
        :operatingsystem        => 'Sles',
        :operatingsystemrelease => '11.1'
      }
    }
  end

  describe 'alter values' do
    let(:facts) {
      {
        :operatingsystem        => 'Sles',
        :operatingsystemrelease => '11.1'
      }
    }
    let(:params) {
      { :sizedatabuffers        => 100,
        :numberdatabuffers      => 100,
        :sizedatabuffersdisk    => 100,
        :numberdatabuffersdisk  => 100,
        :sizedatabuffersft      => 100,
        :numberdatabuffersft    => 100,
        :cdnumberdatabuffers    => 100,
        :cdsizedatabuffers      => 100,
        :cdupdateinterval       => 100,
        :ostcdbusyretrylimit    => 100,
        :netbuffersz            => 100,
        :netbufferszrest        => 100,
        :dpsproxydefaultrecvtmo => 100,
        :dpsproxydefaultsendtmo => 100,
        :maxentriesperadd       => 100,
        :childdelay             => 100,
      }
    }

    it { should contain_file('size_data_buffers').with_content('100') }
    it { should contain_file('number_data_buffers').with_content('100') }
    it { should contain_file('size_data_buffers_disk').with_content('100') }
    it { should contain_file('number_data_buffers_disk').with_content('100') }
    it { should contain_file('size_data_buffers_ft').with_content('100') }
    it { should contain_file('number_data_buffers_ft').with_content('100') }
    it { should contain_file('cd_number_data_buffers').with_content('100') }
    it { should contain_file('cd_size_data_buffers').with_content('100') }
    it { should contain_file('cd_update_interval').with_content('100') }
    it { should contain_file('ost_cd_busy_retry_limit').with_content('100') }
    it { should contain_file('net_buffer_sz').with_content('100') }
    it { should contain_file('net_buffer_sz_rest').with_content('100') }
    it { should contain_file('dps_proxydefaultrecvtmo').with_content('100') }
    it { should contain_file('dps_proxydefaultsendtmo').with_content('100') }
    it { should contain_file('max_entries_per_add').with_content('100') }
    it { should contain_file('child_delay').with_content('100') }
  end

end

