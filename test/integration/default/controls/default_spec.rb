# frozen_string_literal: true

title 'Default Fedora Repository Tests'

control 'yum-fedora-default-01' do
  impact 1.0
  title 'Default Fedora repositories are managed'

  describe file('/etc/yum.repos.d/fedora.repo') do
    it { should exist }
  end

  describe ini('/etc/yum.repos.d/fedora.repo') do
    its('fedora.enabled') { should cmp 1 }
    its('fedora.mirrorlist') { should cmp 'https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch' }
  end

  describe file('/etc/yum.repos.d/updates.repo') do
    it { should exist }
  end

  describe ini('/etc/yum.repos.d/updates.repo') do
    its('updates.enabled') { should cmp 1 }
    its('updates.mirrorlist') { should cmp 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch' }
  end
end

control 'yum-fedora-default-02' do
  impact 1.0
  title 'Default Fedora repositories keep GPG validation'

  %w(
    fedora
    updates
  ).each do |repositoryid|
    describe ini("/etc/yum.repos.d/#{repositoryid}.repo") do
      its("#{repositoryid}.gpgcheck") { should cmp 1 }
      its("#{repositoryid}.gpgkey") { should cmp 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch' }
    end
  end
end

control 'yum-fedora-default-03' do
  impact 0.7
  title 'Stock Fedora repository files are removed'

  %w(
    /etc/yum.repos.d/fedora-updates.repo
    /etc/yum.repos.d/fedora-updates-testing.repo
  ).each do |repo_file|
    describe file(repo_file) do
      it { should_not exist }
    end
  end
end
