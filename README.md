puppet-nbuappliance [![Build Status](https://travis-ci.org/andskli/puppet-nbuappliance.svg?branch=master)](https://travis-ci.org/andskli/puppet-nbuappliance)
============

This is the nbuappliance module, made for managing NetBackup appliances.

#### Important note
On NetBackup appliances with _facter 1.5.2_ you'll need to apply the following patch to `/usr/lib64/ruby/vendor_ruby/1.8/facter/util/confine.rb`, otherwise the apply step will fail on string conversion:
```
  --- /usr/lib64/ruby/vendor_ruby/1.8/facter/util/confine.rb      2014-05-07 12:48:59.000000000 +0200
  +++ /usr/lib64/ruby/vendor_ruby/1.8/facter/util/confine.rb.patched      2014-05-07 13:06:12.000000000 +0200
  @@ -34,7 +34,7 @@
          return false if value.nil?
          
          @values.each { |v|
  -            return true if value.downcase == v.downcase
  +            return true if value.to_s.downcase == v.to_s.downcase
           }
           return false
      end
```
Upgrading to a newer facter version mitigates this issue


License
-------

GPL v2

Support
-------

Please log tickets and issues at http://github.com/andskli/puppet-nbuappliance/issues

Contributing
-------

See the [TODO wiki page](https://github.com/andskli/puppet-nbuappliance/wiki/TODO) for stuff that needs fixing and use [issues](http://github.com/andskli/puppet-nbuappliance/issues) for feature requests

Fork, send PR.. you know the drill.

Usage
-------

```puppet
class { "nbuappliance":
  alert_swadmin => "admin1@domain.com;admin2@domain.com",
}
```

However, there's a bunch of variables to set if you want to. There are reasonable defaults set which are documented below.

### Parameters

#### sizedatabuffers
Defaults to 262144

#### numberdatabuffers
Defaults to 256

#### sizedatabuffersdisk
Defaults to 1048576

#### numberdatabuffersdisk
Defaults to 512

#### sizedatabuffersft
Defaults to 262144

#### numberdatabuffersft
Defaults to 16

#### cdnumberdatabuffers
Defaults to 128

#### cdsizedatabuffers
Defaults to 524288

#### cdwholeimagecopy
Defaults to true

#### cdupdateinterval
Defaults to 180

#### ostcdbusyretrylimit
Defaults to 1500

#### netbuffersz
Defaults to 0

#### netbufferszrest
Defaults to 0

#### dpsproxydefaultrecvtmo
Defaults to 3600

#### dpsproxydefaultsendtmo
Defaults to 36000

#### dpsproxynoexpire
Defaults to true

#### maxentriesperadd
Defaults to 50000

#### parentdelay
Defaults to true

#### childdelay
Defaults to 100

#### fbureadblks
Defaults to `512 128`

#### alert_email
Defaults to ''. Should be defined, 0 or 1 (FIXME TRUE OR FALSE). This value sets if the appliance should call home or not.

#### alert_hwadmin
Defaults to ''

#### alert_swadmin
Defaults to ''

#### alert_smtpserver
Defaults to ''

#### alert_interval
Defaults to 300

#### snmp_enable

#### snmp_community

#### snmp_port

#### proxy_enable
Defaults to false

#### proxy_server
Proxy server to use for call home, defaults to ''

#### proxy_port
Proxy server port to use for call home, defaults to ''

#### proxy_user
Proxy username to use for call home, defaults to ''

#### proxy_pass
Proxy password to use for call home, defaults to ''

#### ch_contact
Contact name for call home

#### ch_contactemail
Call home contact email

#### ch_address
Address where the appliance is located

#### ch_city
City where the appliance is located

#### ch_zip
Zipcode of where the appliance is located

#### ch_state
State where the appliance is located

#### ch_country
Country where the appliance is located

#### ch_companyname
Call home, owners of ze appliance

#### ch_phone
Call home phone info
