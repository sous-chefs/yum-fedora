# Encoding: utf-8

default['yum']['updates-testing-debuginfo']['repositoryid'] = 'updates-testing-debuginfo'
default['yum']['updates-testing-debuginfo']['description'] = 'Fedora $releasever - $basearch - Test Updates Debug'
default['yum']['updates-testing-debuginfo']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-debug-f$releasever&arch=$basearch'
default['yum']['updates-testing-debuginfo']['enabled'] = false
default['yum']['updates-testing-debuginfo']['gpgcheck'] = true
default['yum']['updates-testing-debuginfo']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
