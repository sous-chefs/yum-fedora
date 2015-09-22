name 'yum-fedora'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache 2.0'
description 'Installs and configures the Fedora Yum repositories'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.0'

depends 'yum', '~> 3.2'
supports 'fedora'

source_url 'https://github.com/chef-cookbooks/yum-fedora' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/yum-fedora/issues' if respond_to?(:issues_url)
