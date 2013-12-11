default['yum']['updates-debuginfo']['repositoryid'] = 'updates-debuginfo'
default['yum']['updates-debuginfo']['description'] = 'Fedora $releasever - $basearch - Updates - Debug'
default['yum']['updates-debuginfo']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-debug-f$releasever&arch=$basearch'
default['yum']['updates-debuginfo']['enabled'] = false
default['yum']['updates-debuginfo']['gpgcheck'] = true
default['yum']['updates-debuginfo']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
