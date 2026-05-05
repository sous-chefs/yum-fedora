# frozen_string_literal: true

provides :yum_fedora_repositories
unified_mode true

include YumFedora::Helpers

property :manage_debuginfo, [true, false], default: false
property :manage_source, [true, false], default: false
property :manage_testing, [true, false], default: false
property :enable_debuginfo, [true, false], default: false
property :enable_source, [true, false], default: false
property :enable_testing, [true, false], default: false
property :managed_repositories, Array, default: [], desired_state: false
property :enabled_repositories, Array, default: [], desired_state: false

default_action :create

action_class do
  include YumFedora::Helpers

  def manage_repository?(repositoryid)
    return true if new_resource.managed_repositories.include?(repositoryid)
    return true if new_resource.manage_debuginfo && fedora_debug_repository?(repositoryid)
    return true if new_resource.manage_source && fedora_source_repository?(repositoryid)
    return true if new_resource.manage_testing && fedora_testing_repository?(repositoryid)

    fedora_default_managed?(repositoryid)
  end

  def enable_repository?(repositoryid)
    return true if new_resource.enabled_repositories.include?(repositoryid)
    return true if new_resource.enable_debuginfo && fedora_debug_repository?(repositoryid)
    return true if new_resource.enable_source && fedora_source_repository?(repositoryid)
    return true if new_resource.enable_testing && fedora_testing_repository?(repositoryid)

    fedora_default_enabled?(repositoryid)
  end
end

action :create do
  YumFedora::Helpers::STOCK_REPO_FILES.each do |repo_file|
    file repo_file do
      only_if { platform_family?('fedora') }
      action :delete
    end
  end

  fedora_repository_ids.each do |repositoryid|
    yum_fedora_repository repositoryid do
      managed manage_repository?(repositoryid)
      enabled enable_repository?(repositoryid)
      action :create
    end
  end
end

action :remove do
  fedora_repository_ids.each do |repositoryid|
    yum_fedora_repository repositoryid do
      action :remove
    end
  end
end
