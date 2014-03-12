default['yum']['fedora-source']['repositoryid'] = 'fedora-source'
default['yum']['fedora-source']['description'] = 'Fedora $releasever - Source'
default['yum']['fedora-source']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=$basearch'
default['yum']['fedora-source']['enabled'] = false
default['yum']['fedora-source']['managed'] = false
default['yum']['fedora-source']['metadata_expire'] = '7d'
default['yum']['fedora-source']['gpgcheck'] = true
if node['platform_version'].to_i < 20
  default['yum']['fedora-source']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
else
  default['yum']['fedora-source']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch'
end
