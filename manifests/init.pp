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
  $netbufferszrest        = $nbuappliance::params::netbufferszrest,
  $dpsproxydefaultrecvtmo = $nbuappliance::params::dpsproxydefaultrecvtmo,
  $dpsproxydefaultsendtmo = $nbuappliance::params::dpsproxydefaultsendtmo,
  $dpsproxynoexpire       = $nbuappliance::params::dpsproxynoexpire,
  $maxentriesperadd       = $nbuappliance::params::maxentriesperadd,
  $parentdelay            = $nbuappliance::params::parentdelay,
  $childdelay             = $nbuappliance::params::childdelay,
  $fbureadblks            = $nbuappliance::params::fbureadblks,
  $alert_email            = $nbuappliance::params::callhome_email,
  $alert_senderid         = $nbuappliance::params::callhome_email_senderid,
  $alert_hwadmin          = $nbuappliance::params::callhome_email_hwadmin,
  $alert_swadmin          = $nbuappliance::params::callhome_email_swadmin,
  $alert_smtpserver       = $nbuappliance::params::callhome_smtp_server,
  $alert_interval         = $nbuappliance::params::callhome_notification_interval,
  $snmp_enable            = $nbuappliance::params::callhome_snmp_enable,
  $snmp_community         = $nbuappliance::params::callhome_snmp_community,
  $snmp_port              = $nbuappliance::params::callhome_snmp_port,
  $proxy_enable           = $nbuappliance::params::proxy_enable,
  $proxy_server           = $nbuappliance::params::proxy_server,
  $proxy_port             = $nbuappliance::params::proxy_port,
  $proxy_user             = $nbuappliance::params::proxy_user,
  $proxy_pass             = $nbuappliance::params::proxy_pass,
  $ch_contact             = $nbuappliance::params::callhome_contact,
  $ch_contactname         = $nbuappliance::params::callhome_contactname,
  $ch_contactemail        = $nbuappliance::params::callhome_contactemail,
  $ch_address             = $nbuappliance::params::callhome_address,
  $ch_city                = $nbuappliance::params::callhome_city,
  $ch_zip                 = $nbuappliance::params::callhome_zip,
  $ch_state               = $nbuappliance::params::callhome_state,
  $ch_country             = $nbuappliance::params::callhome_country,
  $ch_companyname         = $nbuappliance::params::callhome_companyname,
  $ch_phone               = $nbuappliance::params::callhome_phone
) inherits nbuappliance::params {

  case $::operatingsystem {
    'SLES': {
      case $::operatingsystemrelease {
        '11.1': {
          include nbuappliance::tune
        }
        default: {
          fail("Not supported subversion of SLES")
        }
      }
    }
    default: {
      fail("Incorrect version of operating system. NBU appliances run SLES")
    }
  }

}

