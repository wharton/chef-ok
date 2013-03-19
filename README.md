Description
===========

Installs the OK framework for ColdFusion.

Requirements
============

Cookbooks
---------

coldfusion10

Attributes
==========

* `node['ok']['install_path']` (Default is /vagrant/frameworks)
* `node['ok']['owner']` (Default is `nil` which will result in owner being set to `node['cf10']['installer']['runtimeuser']`)
* `node['ok']['group']` (Default is bin)
* `node[''ok']['download']['url']` (Default is https://github.com/nmische/cf-ok/archive/0.2.0.zip)

Usage
=====

On ColdFusion server nodes:

    include_recipe "ok"
