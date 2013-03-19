#
# Cookbook Name:: ok
# Recipe:: default
#
# Copyright 2012, Courtney Wilburn, Nathan Mische
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#

# Install unzip if needed

package "unzip" do
  action :install
end

file_name = node['ok']['download']['url'].split('/').last

node.set['ok']['owner'] = node['cf10']['installer']['runtimeuser'] if node['ok']['owner'] == nil

# Download OK

remote_file "#{Chef::Config['file_cache_path']}/#{file_name}" do
  source "#{node['ok']['download']['url']}"
  action :create_if_missing
  mode "0744"
  owner "root"
  group "root"
  not_if { File.directory?("#{node['ok']['install_path']}/ok") }
end

# Create directory if missing

directory "#{node['ok']['install_path']}" do
 owner node['ok']['owner']
 group node['ok']['group']
 mode "0755"
 recursive true
 action :create
 not_if { File.directory?("#{node['ok']['install_path']}") }
end


# Extract archive

script "install_ok" do
  interpreter "bash"
  user "root"
  cwd "#{Chef::Config['file_cache_path']}"
  code <<-EOH
unzip #{file_name} 
mv cf-ok-#{node['ok']['version']}/ #{node['ok']['install_path']}/ok
chown -R #{node['ok']['owner']}:#{node['ok']['group']} #{node['ok']['install_path']}/ok
EOH
  not_if { File.directory?("#{node['ok']['install_path']}/ok") }
end

# Set up ColdFusion mapping

execute "start_cf_for_ok_default_cf_config" do
  command "/bin/true"
  notifies :start, "service[coldfusion]", :immediately
end

coldfusion10_config "extensions" do
  action :set
  property "mapping"
  args ({ "mapName" => "/ok",
          "mapPath" => "#{node['ok']['install_path']}/ok"})
end
