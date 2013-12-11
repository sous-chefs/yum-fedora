require 'spec_helper'

describe 'yum-fedora::default' do
  context 'yum-fedora::default uses default attributes' do
    let(:chef_run) { ChefSpec::Runner.new(:step_into => ['yum_repository']).converge(described_recipe) }

    context 'removing stock configuration files' do
      it 'deletes /etc/yum.repos.d/fedora-updates.repo' do
        expect(chef_run).to delete_file('/etc/yum.repos.d/fedora-updates.repo')
      end

      it 'deletes /etc/yum.repos.d/fedora-updates-testing.repo' do
        expect(chef_run).to delete_file('/etc/yum.repos.d/fedora-updates-testing.repo')
      end
    end

    %w{
      fedora
      fedora-debuginfo
      fedora-source
      updates
      updates-debuginfo
      updates-source
      updates-testing
      updates-testing-debuginfo
      updates-testing-source
      }.each do |repo|
      it "creates yum_repository[#{repo}]" do
        expect(chef_run).to create_yum_repository(repo)
      end

      it "steps into yum_repository and creates template[/etc/yum.repos.d/#{repo}.repo]" do
        expect(chef_run).to render_file("/etc/yum.repos.d/#{repo}.repo")
      end
    end
  end
end
