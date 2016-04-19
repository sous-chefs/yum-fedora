default['yum']['updates-testing-source']['repositoryid'] = 'updates-testing-source'
default['yum']['updates-testing-source']['description'] = 'Fedora $releasever - Test Updates Source'
default['yum']['updates-testing-source']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-source-f$releasever&arch=$basearch'
default['yum']['updates-testing-source']['enabled'] = false
default['yum']['updates-testing-source']['managed'] = false
default['yum']['updates-testing-source']['gpgcheck'] = true
default['yum']['updates-testing-source']['gpgkey'] = if node['platform_version'].to_i < 20
                                                       'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
                                                     else
                                                       'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch'
                                                     end
