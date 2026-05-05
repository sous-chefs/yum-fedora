# frozen_string_literal: true

require 'spec_helper'
require_relative '../../libraries/helpers'

describe YumFedora::Helpers do
  let(:helper_class) do
    Class.new do
      include YumFedora::Helpers
    end
  end

  subject(:helpers) { helper_class.new }

  it 'preserves all public Fedora repository ids' do
    expect(helpers.fedora_repository_ids).to eq(
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
      )
    )
  end

  it 'keeps fedora and updates managed by default' do
    expect(helpers.fedora_default_managed?('fedora')).to be(true)
    expect(helpers.fedora_default_managed?('updates')).to be(true)
  end

  it 'keeps debug, source, and testing repositories unmanaged by default' do
    expect(helpers.fedora_default_managed?('fedora-debuginfo')).to be(false)
    expect(helpers.fedora_default_managed?('updates-source')).to be(false)
    expect(helpers.fedora_default_managed?('updates-testing')).to be(false)
  end
end
