# frozen_string_literal: true

require 'spec_helper'

describe 'yum_fedora_repository' do
  step_into :yum_fedora_repository
  platform 'fedora'

  context 'with the default fedora repository' do
    recipe do
      yum_fedora_repository 'fedora'
    end

    it do
      is_expected.to create_yum_repository('fedora').with(
        description: 'Fedora $releasever - $basearch',
        enabled: true,
        gpgcheck: true,
        gpgkey: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch',
        metadata_expire: '7d',
        mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch'
      )
    end
  end

  context 'with a repository that is unmanaged by default' do
    recipe do
      yum_fedora_repository 'updates-testing'
    end

    it { is_expected.to_not create_yum_repository('updates-testing') }
  end

  context 'with an optional repository explicitly managed and enabled' do
    recipe do
      yum_fedora_repository 'updates-testing' do
        managed true
        enabled true
      end
    end

    it do
      is_expected.to create_yum_repository('updates-testing').with(
        description: 'Fedora $releasever - $basearch - Test Updates',
        enabled: true,
        mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-f$releasever&arch=$basearch'
      )
    end
  end

  context 'with custom repository settings' do
    recipe do
      yum_fedora_repository 'updates' do
        baseurl 'https://internal.example.com/fedora/$releasever/updates/$basearch'
        mirrorlist nil
        sslverify false
      end
    end

    it do
      is_expected.to create_yum_repository('updates').with(
        baseurl: 'https://internal.example.com/fedora/$releasever/updates/$basearch',
        mirrorlist: nil,
        sslverify: false
      )
    end
  end

  context 'with action remove' do
    recipe do
      yum_fedora_repository 'fedora' do
        action :remove
      end
    end

    it { is_expected.to remove_yum_repository('fedora') }
  end
end
