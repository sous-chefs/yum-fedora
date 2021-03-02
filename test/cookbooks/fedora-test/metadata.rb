name              'fedora-test'
license           'Apache-2.0'
description       'Installs and configures the Fedora Yum repositories'
version           '3.0.0'
chef_version      '>= 12.15'

supports 'fedora'

depends  'yum-fedora'
