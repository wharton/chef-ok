maintainer       "The Wharton School - The University of Pennsylvania"
maintainer_email "wilburnc@wharton.upenn.edu"
license          "Apache 2.0"
description      "Installs ColdFusion ok validation framework"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.3"

%w{ ubuntu }.each do |os|
  supports os
end

depends "coldfusion10"

recipe "default", "default recipe"
