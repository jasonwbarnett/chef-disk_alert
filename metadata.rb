name              'disk_alert'
maintainer        'Jason Barnett'
maintainer_email  'J@sonBarnett.com'
license           'MIT'
description       'Monitor disk space and email alerts when limits are reached'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '3.4.1'
recipe 'disk_alert',       'Pushes script to server'
recipe 'disk_alert::cron', 'Ponfigures the cron'

%w{ redhat centos fedora oracle }.each do |os|
  supports os
end

depends 'cron', '>= 1.2.0'
