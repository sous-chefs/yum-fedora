# Encoding: utf-8

require 'spec_helper'

describe 'yum-fedora::default' do
  context 'yum-fedora::default uses default attributes' do
    let(:chef_run) { ChefSpec::Runner.new(:step_into => ['yum_repository']).converge(described_recipe) }

    it 'deletes /etc/yum.repos.d/fedora-updates.repo' do
      expect(chef_run).to delete_file('/etc/yum.repos.d/fedora-updates.repo')
    end

    it 'deletes /etc/yum.repos.d/fedora-updates-testing.repo' do
      expect(chef_run).to delete_file('/etc/yum.repos.d/fedora-updates-testing.repo')
    end

    it 'creates yum_repository[fedora]' do
      expect(chef_run).to create_yum_repository('fedora')
    end

    it 'creates yum_repository[fedora-debuginfo]' do
      expect(chef_run).to create_yum_repository('fedora-debuginfo')
    end

    it 'creates yum_repository[fedora-source]' do
      expect(chef_run).to create_yum_repository('fedora-source')
    end

    it 'creates yum_repository[updates]' do
      expect(chef_run).to create_yum_repository('updates')
    end

    it 'creates yum_repository[updates-debuginfo]' do
      expect(chef_run).to create_yum_repository('updates-debuginfo')
    end

    it 'creates yum_repository[updates-source]' do
      expect(chef_run).to create_yum_repository('updates-source')
    end

    it 'creates yum_repository[updates-testing]' do
      expect(chef_run).to create_yum_repository('updates-testing')
    end

    it 'creates yum_repository[updates-testing-debuginfo]' do
      expect(chef_run).to create_yum_repository('updates-testing-debuginfo')
    end

    it 'creates yum_repository[updates-testing-source]' do
      expect(chef_run).to create_yum_repository('updates-testing-source')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/fedora.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/fedora.repo')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/fedora-debuginfo.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/fedora-debuginfo.repo')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/fedora-source.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/fedora-source.repo')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/updates.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/updates.repo')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/updates-debuginfo.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/updates-debuginfo.repo')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/updates-source.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/updates-source.repo')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/updates-testing.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/updates-testing.repo')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/updates-testing-debuginfo.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/updates-testing-debuginfo.repo')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/updates-testing-source.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/updates-testing-source.repo')
    end

  end
end
