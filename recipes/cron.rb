#
# Cookbook Name:: disk_alert
# Recipes:: default
#
# Author:: Jason Barnett <J@sonBarnett.com>
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


# If "use_cron_d" is set to true, delete the cron entry that uses the cron
# resource built in to Chef and instead use the cron_d LWRP.
if node['disk_alert']['cron']['use_cron_d']
  cron 'disk_alert' do
    action :delete
  end

  cron_d 'disk_alert' do
    minute  node['disk_alert']['cron']['minute']
    hour    node['disk_alert']['cron']['hour']
    path    node['disk_alert']['cron']['path']   if node['disk_alert']['cron']['path']
    mailto  node['disk_alert']['cron']['mailto'] if node['disk_alert']['cron']['mailto']
    user    'root'
    cmd = ''
    cmd << "/bin/sleep #{sleep_time}; " if sleep_time
    cmd << "#{env} #{client_bin} > #{log_file} 2>&1"
    command cmd
  end
else
  cron_d 'disk_alert' do
    action :delete
  end

  cron 'disk_alert' do
    minute  node['disk_alert']['cron']['minute']
    hour    node['disk_alert']['cron']['hour']
    path    node['disk_alert']['cron']['path']   if node['disk_alert']['cron']['path']
    mailto  node['disk_alert']['cron']['mailto'] if node['disk_alert']['cron']['mailto']
    user    'root'
    cmd = ''
    cmd << "/bin/sleep #{sleep_time}; " if sleep_time
    cmd << "#{env} #{client_bin} > #{log_file} 2>&1"
    command cmd
  end
end
