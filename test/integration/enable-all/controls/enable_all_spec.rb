# frozen_string_literal: true

title 'All Fedora Repository Tests'

expected_repositories = {
  'fedora' => 'https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch',
  'fedora-debuginfo' => 'https://mirrors.fedoraproject.org/metalink?repo=fedora-debug-$releasever&arch=$basearch',
  'fedora-source' => 'https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=$basearch',
  'updates' => 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch',
  'updates-debuginfo' => 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-debug-f$releasever&arch=$basearch',
  'updates-source' => 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-source-f$releasever&arch=$basearch',
  'updates-testing' => 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-f$releasever&arch=$basearch',
  'updates-testing-debuginfo' => 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-debug-f$releasever&arch=$basearch',
  'updates-testing-source' => 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-source-f$releasever&arch=$basearch',
}

control 'yum-fedora-enable-all-01' do
  impact 1.0
  title 'All Fedora repositories are managed and enabled'

  expected_repositories.each do |repositoryid, mirrorlist|
    describe file("/etc/yum.repos.d/#{repositoryid}.repo") do
      it { should exist }
    end

    describe ini("/etc/yum.repos.d/#{repositoryid}.repo") do
      its("#{repositoryid}.enabled") { should cmp 1 }
      its("#{repositoryid}.mirrorlist") { should cmp mirrorlist }
    end
  end
end

control 'yum-fedora-enable-all-02' do
  impact 1.0
  title 'All Fedora repositories keep GPG validation'

  expected_repositories.each_key do |repositoryid|
    describe ini("/etc/yum.repos.d/#{repositoryid}.repo") do
      its("#{repositoryid}.gpgcheck") { should cmp 1 }
      its("#{repositoryid}.gpgkey") { should cmp 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch' }
    end
  end
end
