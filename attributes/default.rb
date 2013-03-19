# OK Download
default['ok']['install_path'] = "/vagrant/frameworks"
default['ok']['owner'] = nil
default['ok']['group'] = "bin"
default['ok']['version'] = "0.2.0"
default['ok']['download']['url'] = "https://github.com/nmische/cf-ok/archive/#{node['ok']['version']}.zip"