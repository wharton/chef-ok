Description
===========

Installs the OK framework for ColdFusion.

Requirements
============

Cookbooks
---------

coldfusion902

Attributes
==========

* `node['ok']['install_path']` (Default is /vagrant/frameworks)
* `node['ok']['owner']` (Default is `nil` which will result in owner being set to `node['cf10']['installer']['runtimeuser']`)
* `node['ok']['group']` (Default is bin)
* `node['ok']['version']` (Default is 0.2.0)
* `node[''ok']['download']['url']` (Default is https://github.com/nmische/cf-ok/archive/#{node['ok']['version']}.zip)

Usage
=====

On ColdFusion server nodes:

    include_recipe "ok"
