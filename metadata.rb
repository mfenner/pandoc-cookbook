name              "pandoc"
maintainer        "Martin Fenner"
maintainer_email  "mfenner@plos.org"
license           "MIT"
description       "Install Pandoc"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.0"
depends           "apt"
depends           "build-essential"
depends           "git"

%w{ ubuntu }.each do |platform|
  supports platform
end
