default['yum']['updates-testing']['repositoryid'] = 'updates-testing'
default['yum']['updates-testing']['description'] = 'Fedora $releasever - $basearch - Test Updates'
default['yum']['updates-testing']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-f$releasever&arch=$basearch'
default['yum']['updates-testing']['enabled'] = false
default['yum']['updates-testing']['managed'] = false
default['yum']['updates-testing']['gpgcheck'] = true
default['yum']['updates-testing']['gpgkey'] = if node['platform_version'].to_i < 20
                                                'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
                                              else
                                                'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch'
                                              end
