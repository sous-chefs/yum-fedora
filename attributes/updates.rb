default['yum']['updates']['repositoryid'] = 'updates'
default['yum']['updates']['description'] = 'Fedora $releasever - $basearch - Updates'
default['yum']['updates']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch'
default['yum']['updates']['enabled'] = true
default['yum']['updates']['managed'] = true
default['yum']['updates']['gpgcheck'] = true
default['yum']['updates']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch'
