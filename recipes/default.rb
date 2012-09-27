#
# Cookbook Name:: caos
# Recipe:: ok
#
# Copyright 2012, Courtney Wilburn
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

#Checkout OK Framework

git "#{node['cf902']['webroot']}/ok" do                            
  repository "#{node['caos']['ok']['git']['repository']}"
  revision "#{node['caos']['ok']['git']['revision']}"                                  
  action :sync                                     
  ssh_wrapper "#{Chef::Config['file_cache_path']}/wrap-ssh4git.sh"      	               
end

# Set up ColdFusion mapping

execute "start_cf_for_ok_default_cf_config" do
  command "/bin/true"
  notifies :start, "service[coldfusion]", :immediately
end

coldfusion902_config "extensions" do
  action :set
  property "mapping"
  args ({ "mapName" => "/ok",
          "mapPath" => "#{node['caos']['ok']['install_path']}/ok"})
end
