# == Class: nbuappliance::callhome
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
class nbuappliance::callhome inherits nbuappliance::params {

  exec { "persist_to_cmdb":
    command   => "/opt/NBUAppliance/scripts/hwmon/callhome_persist_data_cmdb.pl",
    subscribe => File["callhome_email_config"],
  }

  file { "callhome_email_config":
    path      => "/usr/openv/runtime_data/bp.email",
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    content   => template('nbuappliance/callhome/email_config.erb'),
  }

}
