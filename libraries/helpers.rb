# frozen_string_literal: true

module YumFedora
  module Helpers
    REPOSITORIES = {
      'fedora' => {
        description: 'Fedora $releasever - $basearch',
        mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch',
        enabled: true,
        managed: true,
        metadata_expire: '7d',
      },
      'fedora-debuginfo' => {
        description: 'Fedora $releasever - $basearch - Debug',
        mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=fedora-debug-$releasever&arch=$basearch',
        enabled: false,
        managed: false,
        metadata_expire: '7d',
      },
      'fedora-source' => {
        description: 'Fedora $releasever - Source',
        mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=$basearch',
        enabled: false,
        managed: false,
        metadata_expire: '7d',
      },
      'updates' => {
        description: 'Fedora $releasever - $basearch - Updates',
        mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch',
        enabled: true,
        managed: true,
      },
      'updates-debuginfo' => {
        description: 'Fedora $releasever - $basearch - Updates - Debug',
        mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-debug-f$releasever&arch=$basearch',
        enabled: false,
        managed: false,
      },
      'updates-source' => {
        description: 'Fedora $releasever - Updates Source',
        mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-source-f$releasever&arch=$basearch',
        enabled: false,
        managed: false,
      },
      'updates-testing' => {
        description: 'Fedora $releasever - $basearch - Test Updates',
        mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-f$releasever&arch=$basearch',
        enabled: false,
        managed: false,
      },
      'updates-testing-debuginfo' => {
        description: 'Fedora $releasever - $basearch - Test Updates Debug',
        mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-debug-f$releasever&arch=$basearch',
        enabled: false,
        managed: false,
      },
      'updates-testing-source' => {
        description: 'Fedora $releasever - Test Updates Source',
        mirrorlist: 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-source-f$releasever&arch=$basearch',
        enabled: false,
        managed: false,
      },
    }.freeze unless const_defined?(:REPOSITORIES)

    STOCK_REPO_FILES = %w(
      /etc/yum.repos.d/fedora-updates.repo
      /etc/yum.repos.d/fedora-updates-testing.repo
    ).freeze unless const_defined?(:STOCK_REPO_FILES)

    def fedora_repository_ids
      REPOSITORIES.keys
    end

    def fedora_repository_config(repositoryid)
      REPOSITORIES.fetch(repositoryid)
    end

    def fedora_repository?(repositoryid)
      REPOSITORIES.key?(repositoryid)
    end

    def fedora_debug_repository?(repositoryid)
      repositoryid.end_with?('-debuginfo')
    end

    def fedora_source_repository?(repositoryid)
      repositoryid.end_with?('-source')
    end

    def fedora_testing_repository?(repositoryid)
      repositoryid.start_with?('updates-testing')
    end

    def fedora_default_managed?(repositoryid)
      fedora_repository_config(repositoryid).fetch(:managed)
    end

    def fedora_default_enabled?(repositoryid)
      fedora_repository_config(repositoryid).fetch(:enabled)
    end

    def fedora_default_description(repositoryid)
      fedora_repository_config(repositoryid).fetch(:description)
    end

    def fedora_default_mirrorlist(repositoryid)
      fedora_repository_config(repositoryid).fetch(:mirrorlist)
    end

    def fedora_default_metadata_expire(repositoryid)
      fedora_repository_config(repositoryid)[:metadata_expire]
    end
  end
end
