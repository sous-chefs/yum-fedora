default['yum']['updates-source']['repositoryid'] = 'updates-source'
default['yum']['updates-source']['description'] = 'Fedora $releasever - Updates Source'
default['yum']['updates-source']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-source-f$releasever&arch=$basearch'
default['yum']['updates-source']['enabled'] = false
default['yum']['updates-source']['managed'] = false
default['yum']['updates-source']['gpgcheck'] = true
default['yum']['updates-source']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
