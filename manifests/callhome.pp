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

  $snmp_enabled = $nbuappliance::snmp_enable ? {
    true      => '1',
    false     => '0',
    default   => '1'
  }

  $proxy_enabled = $nbuappliance::proxy_enable ? {
    true      => '1',
    false     => '0',
    default   => '0'
  }

  exec { "persist_to_cmdb":
    command   => "/opt/NBUAppliance/scripts/hwmon/callhome_persist_data_cmdb.pl",
    subscribe => [
      File["callhome_email_config"],
      File["callhome_chinfo"],
    ],
  }

  file { "callhome_email_config":
    path      => "/usr/openv/runtime_data/bp.email",
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    content   => template('nbuappliance/callhome/email_config.erb'),
  }

  file { "callhome_chinfo":
    path      => "/usr/openv/runtime_data/chinfo.txt",
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
  }

  file_line { "snmp_enable":
    path      => '/usr/openv/runtime_data/chinfo.txt',
    match     => "^SNMP_ENABLE=",
    line      => "SNMP_ENABLE=${snmp_enabled}",
  }

  file_line { "snmp_community":
    path      => '/usr/openv/runtime_data/chinfo.txt',
    match     => "^SNMP_COMMUNITY=",
    line      => "SNMP_COMMUNITY=${nbuappliance::snmp_community}",
  }

  file_line { "snmp_port":
    path      => '/usr/openv/runtime_data/chinfo.txt',
    match     => "^SNMP_PORT=",
    line      => "SNMP_PORT=${nbuappliance::snmp_port}",
  }

  if $nbuappliance::proxy_enable {
    file_line { "proxy_enable":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^PROXY_ENABLED=",
      line      => "PROXY_ENABLED=${proxy_enabled}",
    }
  }

  if size($nbuappliance::proxy_server) > 0 {
    file_line { "proxy_server":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^PROXY_SERVER=",
      line      => "PROXY_SERVER=${nbuappliance::proxy_server}",
    }
  }

  if $nbuappliance::proxy_port {
    file_line { "proxy_port":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^PROXY_PORT=",
      line      => "PROXY_PORT=${nbuappliance::proxy_port}",
    }
  }

  if $nbuappliance::proxy_user {
    file_line { "proxy_username":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^PROXY_USERNAME=",
      line      => "PROXY_USERNAME=${nbuappliance::proxy_user}",
    }
  }

  if $nbuappliance::proxy_pass {
    file_line { "proxy_password":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^PROXY_PASSWORD=",
      line      => "PROXY_PASSWORD=${nbuappliance::proxy_pass}",
    }
  }

  if $nbuappliance::ch_contact {
    file_line { "ch_contact":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^CONTACT=",
      line      => "CONTACT=${nbuappliance::ch_contact}",
    }
  }

  if $nbuappliance::ch_contactemail {
    file_line { "ch_contactemail":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^CONTEMAIL=",
      line      => "CONTEMAIL=${nbuappliance::ch_contactemail}",
    }
  }

  if $nbuappliance::ch_address {
    file_line { "ch_address":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^ADDRESS=",
      line      => "ADDRESS=${nbuappliance::ch_address}",
    }
  }

  if $nbuappliance::ch_city {
    file_line { "ch_city":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^CITY=",
      line      => "CITY=${nbuappliance::ch_city}",
    }
  }

  if $nbuappliance::ch_zip {
    file_line { "ch_zip":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^ZIP=",
      line      => "ZIP=${nbuappliance::ch_zip}",
    }
  }

  if $nbuappliance::ch_state {
    file_line { "ch_state":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^STATE=",
      line      => "STATE=${nbuappliance::ch_state}",
    }
  }

  if $nbuappliance::ch_country {
    file_line { "ch_country":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^COUNTRY=",
      line      => "COUNTRY=${nbuappliance::ch_country}",
    }
  }

  if $nbuappliance::ch_companyname {
    file_line { "ch_companyname":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^COMPANYNAME=",
      line      => "COMPANYNAME=${nbuappliance::ch_companyname}",
    }
  }

  if $nbuappliance::ch_phone {
    file_line { "ch_phone":
      path      => '/usr/openv/runtime_data/chinfo.txt',
      match     => "^PHONE=",
      line      => "PHONE=${nbuappliance::ch_phone}",
    }
  }

}
