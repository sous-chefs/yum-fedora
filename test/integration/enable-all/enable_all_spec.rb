e_rel = os.release.to_i
e_arch = 'x86_64'

describe yum.repo('fedora-debuginfo') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "https://mirrors.fedoraproject.org/metalink?repo=fedora-debug-#{e_rel}&arch=#{e_arch}" }
end

describe yum.repo('fedora-source') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "https://mirrors.fedoraproject.org/metalink?repo=fedora-source-#{e_rel}&arch=#{e_arch}" }
end

describe yum.repo('updates-debuginfo') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "https://mirrors.fedoraproject.org/metalink?repo=updates-released-debug-f#{e_rel}&arch=#{e_arch}" }
end

describe yum.repo('updates-source') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "https://mirrors.fedoraproject.org/metalink?repo=updates-released-source-f#{e_rel}&arch=#{e_arch}" }
end

describe yum.repo('updates-testing') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "https://mirrors.fedoraproject.org/metalink?repo=updates-testing-f#{e_rel}&arch=#{e_arch}" }
end

describe yum.repo('updates-testing-debuginfo') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "https://mirrors.fedoraproject.org/metalink?repo=updates-testing-debug-f#{e_rel}&arch=#{e_arch}" }
end

describe yum.repo('updates-testing-source') do
  it { should exist }
  it { should be_enabled }
  its('mirrors') { should cmp "https://mirrors.fedoraproject.org/metalink?repo=updates-testing-source-f#{e_rel}&arch=#{e_arch}" }
end

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
  fedora-debuginfo
  fedora-source
  updates
  updates-debuginfo
  updates-source
  updates-testing
  updates-testing-debuginfo
  updates-testing-source
).each do |repo|
  describe ini("/etc/yum.repos.d/#{repo}.repo") do
    its("#{repo}.gpgcheck") { should cmp 1 }
    its("#{repo}.gpgkey") { should cmp 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch' }
  end
end
