e_rel = os.release.to_i
e_arch = 'x86_64'

describe yum.repo('fedora') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "https://mirrors.fedoraproject.org/metalink?repo=fedora-#{e_rel}&arch=#{e_arch}" }
end

describe yum.repo('updates') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "https://mirrors.fedoraproject.org/metalink?repo=updates-released-f#{e_rel}&arch=#{e_arch}" }
end

%w(
  fedora
  updates
).each do |repo|
  describe ini("/etc/yum.repos.d/#{repo}.repo") do
    its("#{repo}.gpgcheck") { should cmp 1 }
    its("#{repo}.gpgkey") { should cmp 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch' }
  end
end
