maintainer       "Promet Solutions"
maintainer_email "marius@promethost.com"
license          "Apache 2.0"
description      "Installs/Configures nodejs"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.6.5"
recipe           "nodejs", "Installs Node.JS from source"
recipe           "nodejs::npm", "Installs npm - a package manager for node"
recipe           "nodejs::package", "Installs Node.JS from package. Required for statsd."

depends          "build-essential"
