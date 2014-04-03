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
class nbuappliance(
  $sizedatabuffers        = $nbuappliance::params::sizedatabuffers,
  $numberdatabuffers      = $nbuappliance::params::numberdatabuffers,
  $sizedatabuffersdisk    = $nbuappliance::params::sizedatabuffersdisk,
  $numberdatabuffersdisk  = $nbuappliance::params::numberdatabuffersdisk,
  $sizedatabuffersft      = $nbuappliance::params::sizedatabuffersft,
  $numberdatabuffersft    = $nbuappliance::params::numberdatabuffersft,
  $cdnumberdatabuffers    = $nbuappliance::params::cdnumberdatabuffers,
  $cdsizedatabuffers      = $nbuappliance::params::cdsizedatabuffers,
  $cdwholeimagecopy       = $nbuappliance::params::cdwholeimagecopy,
  $cdupdateinterval       = $nbuappliance::params::cdupdateinterval,
  $ostcdbusyretrylimit    = $nbuappliance::params::ostcdbusyretrylimit,
  $netbuffersz            = $nbuappliance::params::netbuffersz,
  $netbufferszrest        = $nbuappliance::params::netbufferszrest
) inherits nbuappliance::params {

  include nbuappliance::tune

}

