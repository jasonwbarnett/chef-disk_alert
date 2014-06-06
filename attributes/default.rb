#
# Cookbook Name:: disk_alert
# Attributes:: default
#
# Author:: Jason Barnett (<J@sonBarnett.com>)
#
# The MIT License (MIT)
#
# Copyright (c) 2014 Jason Barnett
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.)
#

# default attributes for all platforms
default['disk_alert']['notification_email'] = 'root'
default['disk_alert']['alert_level']        = '80'
default['disk_alert']['script_location']    = '/etc/cron.daily/diskAlert'
default['disk_alert']['script_owner']       = 'root'
default['disk_alert']['script_group']       = 'root'
