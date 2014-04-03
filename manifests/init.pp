# == Class: nbuappliance
#
# This module manages NetBackup appliances.
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
#    
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
class nbuappliance (
  $sizedatabuffers        = $nbuappliance::sizedatabuffers,
  $numberdatabuffers      = $nbuappliance::numberdatabuffers,
  $sizedatabuffersdisk    = $nbuappliance::sizedatabuffersdisk,
  $numberdatabuffersdisk  = $nbuappliance::numberdatabuffersdisk,
  $sizedatabuffersft      = $nbuappliance::sizedatabuffersft,
  $numberdatabuffersft    = $nbuappliance::numberdatabuffersft,
  $cdnumberdatabuffers    = $nbuappliance::cdnumberdatabuffers,
  $cdsizedatabuffers      = $nbuappliance::cdsizedatabuffers,
  $cdwholeimagecopy       = $nbuappliance::cdwholeimagecopy,
  $cdupdateinterval       = $nbuappliance::cdupdateinterval,
  $ostcdbusyretrylimit    = $nbuappliance::ostcdbusyretrylimit,
  $netbuffersz            = $nbuappliance::netbuffersz,
  $netbufferszrest        = $nbuappliance::netbufferszrest,
  ) {

  file { "size_data_buffers":
    ensure        => file,
    path          => $nbuappliance::path_sizedatabuffers,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    content       => "${::sizedatabuffers}",
  }

  file { "number_data_buffers":
    ensure        => file,
    path          => $nbuappliance::path_numberdatabuffers,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    content       => "${::numberdatabuffers}",
  }

  file { "size_data_buffers_disk":
    ensure        => file,
    path          => $nbuappliance::path_sizedatabuffersdisk,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    content       => "${::sizedatabuffersdisk}"
  }

  file { "size_data_buffers_ft":
    ensure        => file,
    path          => $nbuappliance::path_sizedatabuffersft,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    content       => "${nbuappliance::sizedatabuffersft}",
  }

  file { "number_data_buffers_ft":
    ensure        => file,
    path          => $nbuappliance::path_numberdatabuffersft,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    content       => "${nbuappliance::numberdatabuffersft}",
  }

  file { "cd_number_data_buffers":
    ensure        => file,
    path          => $nbuappliance::path_cdnumberdatabuffers,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    content       => "${nbuappliance::cdnumberdatabuffers}",
  }

  file { "cd_size_data_buffers":
    ensure        => file,
    path          => $nbuappliance::path_cdsizedatabuffers,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    content       => "${nbuappliance::cdsizedatabuffers}",
  }

  file { "cd_whole_image_copy":
    ensure        => $nbuappliance::cdwholeimagecopy_enable,
    path          => $nbuappliance::path_cdwholeimagecopy,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
  }

  file { "cd_update_interval":
    ensure        => file,
    path          => $nbuappliance::path_cdupdateinterval,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    content       => "${nbuappliance::cdupdateinterval}",
  }

  file { "ost_cd_busy_retry_limit":
    ensure        => file,
    path          => $nbuappliance::path_ostcdbusyretrylimit,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    content       => "${nbuappliance::ostcdbusyretrylimit}",
  }

  file { "net_buffer_sz":
    ensure        => file,
    path          => $nbuappliance::path_netbuffersz,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    content       => "${nbuappliance::netbuffersz}",
  }

  file { "net_buffer_sz_rest":
    ensure        => file,
    path          => $nbuappliance::netbufferszrest,
    owner         => 'root',
    group         => 'root',
    mode          => '0644',
    content       => "${nbuappliance::netbufferszrest}",
  }

}
