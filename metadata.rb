name             "ok"
maintainer       "The Wharton School - The University of Pennsylvania"
maintainer_email "wilburnc@wharton.upenn.edu"
license          "Apache 2.0"
description      "Installs/Configures OK"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.3.1"

%w{ centos redhat ubuntu }.each do |os|
  supports os
end

depends "coldfusion902"

recipe "ok", "Installs OK and adds a ColdFusion mapping."
