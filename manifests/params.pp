# == Class: nbuappliance::params
#
# Parameters for the nbuappliance module
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { nbuappliance:
#  }
#
# === Authors
#
# Andreas Lindh <andreas@superblock.se>
#
# === Copyright
#
# Copyright 2014 Andreas Lindh, unless otherwise noted.
#
class nbuappliance::params {

  $path_sizedatabuffers         = '/usr/openv/netbackup/db/config/SIZE_DATA_BUFFERS'
  $sizedatabuffers              = '262144'

  $path_numberdatabuffers       = '/usr/openv/netbackup/db/config/NUMBER_DATA_BUFFERS'
  $numberdatabuffers            = '256'

  $path_sizedatabuffersdisk     = '/usr/openv/netbackup/db/config/SIZE_DATA_BUFFERS_DISK'
  $sizedatabuffersdisk          = '1048576'

  $path_numberdatabuffersdisk   = '/usr/openv/netbackup/db/config/NUMBER_DATA_BUFFERS_DISK'
  $numberdatabuffersdisk        = '512'

  $path_sizedatabuffersft       = '/usr/openv/netbackup/db/config/SIZE_DATA_BUFFERS_FT'
  $sizedatabuffersft            = '262144'

  $path_numberdatabuffersft     = '/usr/openv/netbackup/db/config/NUMBER_DATA_BUFFERS_FT'
  $numberdatabuffersft          = '16'

  $path_cdnumberdatabuffers     = '/usr/openv/netbackup/db/config/CD_NUMBER_DATA_BUFFERS'
  $cdnumberdatabuffers          = '128'

  $path_cdsizedatabuffers       = '/usr/openv/netbackup/db/config/CD_SIZE_DATA_BUFFERS'
  $cdsizedatabuffers            = '524288'

  $path_cdwholeimagecopy        = '/usr/openv/netbackup/db/config/CD_WHOLE_IMAGE_COPY'
  $cdwholeimagecopy             = undef

  $path_cdupdateinterval        = '/usr/openv/netbackup/db/config/CD_UPDATE_INTERVAL'
  $cdupdateinterval             = '180'

  $path_ostcdbusyretrylimit     = '/usr/openv/netbackup/db/config/OST_CD_BUSY_RETRY_LIMIT'
  $ostcdbusyretrylimit          = '1500'

  $path_netbuffersz             = '/usr/openv/netbackup/NET_BUFFER_SZ'
  $netbuffersz                  = '0'

  $path_netbufferszrest         = '/usr/openv/netbackup/NET_BUFFER_SZ_REST'
  $netbufferszrest              = '0'

  $path_dpsproxydefaultrecvtmo  = '/usr/openv/netbackup/db/config/DPS_PROXYDEFAULTRECVTMO'
  $dpsproxydefaultrecvtmo       = '3600'

  $path_dpsproxydefaultsendtmo  = '/usr/openv/netbackup/db/config/DPS_PROXYDEFAULTSENDTMO'
  $dpsproxydefaultsendtmo       = '3600'

  $path_dpsproxynoexpire        = '/usr/openv/netbackup/db/config/DPS_PROXYNOEXPIRE'
  $dpsproxynoexpire             = undef

  $path_maxentriesperadd        = '/usr/openv/netbackup/db/config/MAX_ENTRIES_PER_ADD'
  $maxentriesperadd             = '50000'

  $path_parentdelay             = '/usr/openv/netbackup/db/config/PARENT_DELAY'
  $parentdelay                  = undef

  $path_childdelay              = '/usr/openv/netbackup/db/config/CHILD_DELAY'
  $childdelay                   = '100'

  $path_fbureadblks             = '/usr/openv/netbackup/FBU_READBLKS'
  $fbureadblks                  = '512 128'

}
