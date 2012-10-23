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
* `node[''ok']['download']['url']` (Default is https://github.com/downloads/nmische/cf-ok/ok-0.1.zip)

Usage
=====

On ColdFusion server nodes:

    include_recipe "ok"
