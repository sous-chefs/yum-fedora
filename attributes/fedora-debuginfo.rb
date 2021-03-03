default['yum']['fedora-debuginfo']['repositoryid'] = 'fedora-debuginfo'
default['yum']['fedora-debuginfo']['description'] = 'Fedora $releasever - $basearch - Debug'
default['yum']['fedora-debuginfo']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=fedora-debug-$releasever&arch=$basearch'
default['yum']['fedora-debuginfo']['enabled'] = false
default['yum']['fedora-debuginfo']['managed'] = false
default['yum']['fedora-debuginfo']['metadata_expire'] = '7d'
default['yum']['fedora-debuginfo']['gpgcheck'] = true
default['yum']['fedora-debuginfo']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch'
