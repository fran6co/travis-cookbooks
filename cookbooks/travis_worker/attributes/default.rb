default['travis']['worker']['home'] = '/home/deploy'
default['travis']['worker']['repository'] = 'git://github.com/travis-ci/travis-worker.git'
default['travis']['worker']['ref'] = 'master'
default['travis']['worker']['amqp']['host'] = 'localhost'
default['travis']['worker']['amqp']['port'] = 1234
default['travis']['worker']['amqp']['username'] = 'travis'
default['travis']['worker']['amqp']['password'] = 'travis'
default['travis']['worker']['amqp']['virtual_host'] = 'travis'
default['travis']['worker']['vms'] = 20
default['travis']['worker']['env'] = 'ruby'
default['travis']['worker']['hostname'] = "#{node['hostname']}.bluebox.travis-ci.com"
default['travis']['worker']['log_level'] = 'info'
default['travis']['worker']['workers'] = 1
default['travis']['worker']['hosts'] = {}
default['travis']['worker']['restart_sleep'] = rand(0..900)
default['travis']['worker']['restart_begin_hour'] = 2
default['papertrail']['watch_files'] = {}

1.upto(node['travis']['worker']['workers']) do |num|
  set['papertrail']['watch_files']["/etc/sv/travis-worker-#{num}/log/main/current"] = 'travis-worker'
end
