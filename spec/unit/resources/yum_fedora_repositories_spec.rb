# frozen_string_literal: true

require 'spec_helper'

describe 'yum_fedora_repositories' do
  step_into :yum_fedora_repositories
  platform 'fedora'

  context 'with default properties' do
    recipe do
      yum_fedora_repositories 'default'
    end

    it { is_expected.to delete_file('/etc/yum.repos.d/fedora-updates.repo') }
    it { is_expected.to delete_file('/etc/yum.repos.d/fedora-updates-testing.repo') }
    it { is_expected.to create_yum_fedora_repository('fedora').with(managed: true, enabled: true) }
    it { is_expected.to create_yum_fedora_repository('updates').with(managed: true, enabled: true) }
    it { is_expected.to create_yum_fedora_repository('fedora-debuginfo').with(managed: false, enabled: false) }
    it { is_expected.to create_yum_fedora_repository('updates-testing').with(managed: false, enabled: false) }
  end

  context 'with all optional repositories managed and enabled' do
    recipe do
      yum_fedora_repositories 'all' do
        manage_debuginfo true
        manage_source true
        manage_testing true
        enable_debuginfo true
        enable_source true
        enable_testing true
      end
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
    ).each do |repositoryid|
      it { is_expected.to create_yum_fedora_repository(repositoryid).with(managed: true, enabled: true) }
    end
  end

  context 'with action remove' do
    recipe do
      yum_fedora_repositories 'all' do
        action :remove
      end
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
    ).each do |repositoryid|
      it { is_expected.to remove_yum_fedora_repository(repositoryid) }
    end
  end
end
