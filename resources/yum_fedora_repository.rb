# frozen_string_literal: true

provides :yum_fedora_repository
unified_mode true

include YumFedora::Helpers

property :repositoryid, String, name_property: true
property :baseurl, [String, Array]
property :cost, [Integer, String]
property :description, String, default: lazy { fedora_default_description(repositoryid) }
property :enabled, [true, false], default: lazy { fedora_default_enabled?(repositoryid) }
property :enablegroups, [true, false]
property :exclude, [String, Array]
property :failovermethod, String
property :fastestmirror_enabled, [true, false]
property :gpgcheck, [true, false], default: true
property :gpgkey, [String, Array], default: 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch'
property :http_caching, String
property :include_config, String
property :includepkgs, [String, Array]
property :keepalive, [true, false]
property :managed, [true, false], default: lazy { fedora_default_managed?(repositoryid) }, desired_state: false
property :max_retries, [Integer, String]
property :metadata_expire, [String, NilClass], default: lazy { fedora_default_metadata_expire(repositoryid) }
property :mirror_expire, [Integer, String]
property :mirrorlist, [String, NilClass], default: lazy { fedora_default_mirrorlist(repositoryid) }
property :mirrorlist_expire, [Integer, String]
property :password, String, sensitive: true
property :priority, [Integer, String]
property :proxy, String
property :proxy_password, String, sensitive: true
property :proxy_username, String
property :report_instanceid, [true, false]
property :skip_if_unavailable, [true, false]
property :source, String
property :sslcacert, String
property :sslclientcert, String
property :sslclientkey, String
property :sslverify, [true, false]
property :timeout, [Integer, String]
property :username, String

default_action :create

action_class do
  include YumFedora::Helpers

  def yum_repository_properties
    %i(
      baseurl cost description enabled enablegroups exclude failovermethod fastestmirror_enabled
      gpgcheck gpgkey http_caching include_config includepkgs keepalive max_retries
      metadata_expire mirror_expire mirrorlist mirrorlist_expire password priority proxy
      proxy_password proxy_username report_instanceid skip_if_unavailable source sslcacert
      sslclientcert sslclientkey sslverify timeout username
    )
  end

  def yum_repository_property_values
    yum_repository_properties.each_with_object({}) do |property_name, values|
      value = new_resource.public_send(property_name)
      values[property_name] = value unless value.nil?
    end
  end
end

action :create do
  raise ArgumentError, "Unsupported Fedora repository '#{new_resource.repositoryid}'" unless fedora_repository?(new_resource.repositoryid)

  repository_values = yum_repository_property_values

  yum_repository new_resource.repositoryid do
    repository_values.each do |property_name, value|
      public_send(property_name, value)
    end

    only_if { platform_family?('fedora') && new_resource.managed }
    action :create
  end
end

action :remove do
  yum_repository new_resource.repositoryid do
    only_if { platform_family?('fedora') }
    action :remove
  end
end
