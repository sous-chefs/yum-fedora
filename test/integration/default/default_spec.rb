describe file('/etc/yum.repos.d/fedora-updates.repo') do
  it { should_not exist }
end

describe file('/etc/yum.repos.d/fedora-updates-testing.repo') do
  it { should_not exist }
end

describe file('/etc/yum.repos.d/fedora.repo') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/etc/yum.repos.d/updates.repo') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
