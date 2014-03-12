default['yum']['fedora']['repositoryid'] = 'fedora'
default['yum']['fedora']['description'] = 'Fedora $releasever - $basearch'
default['yum']['fedora']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch'
default['yum']['fedora']['enabled'] = true
default['yum']['fedora']['managed'] = true
default['yum']['fedora']['metadata_expire'] = '7d'
default['yum']['fedora']['gpgcheck'] = true
if node['platform_version'].to_i < 20
  default['yum']['fedora']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
else
  default['yum']['fedora']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch'
end
