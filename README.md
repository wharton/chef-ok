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

* `node['ok']['install_path']` (Default is /var/www/frameworks)
* `node[''ok']['download']['url']` (Default is https://github.com/nmische/cf-ok/archive/0.1.0.zip)

Usage
=====

On ColdFusion server nodes:

    include_recipe "ok"
