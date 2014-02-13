require 'spec_helper'

describe 'yum-fedora::default' do
  context 'yum-fedora::default uses default attributes' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set['yum']['fedora']['managed'] = true
        node.set['yum']['fedora-debuginfo']['managed'] = true
        node.set['yum']['fedora-source']['managed'] = true
        node.set['yum']['updates']['managed'] = true
        node.set['yum']['updates-debuginfo']['managed'] = true
        node.set['yum']['updates-source']['managed'] = true
        node.set['yum']['updates-testing']['managed'] = true
        node.set['yum']['updates-testing-debuginfo']['managed'] = true
        node.set['yum']['updates-testing-source']['managed'] = true
      end.converge(described_recipe)
    end

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
    end
  end
end
