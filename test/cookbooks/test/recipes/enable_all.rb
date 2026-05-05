# frozen_string_literal: true

yum_fedora_repositories 'all' do
  manage_debuginfo true
  manage_source true
  manage_testing true
  enable_debuginfo true
  enable_source true
  enable_testing true
end
