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
).each do |repo|
  node.default['yum'][repo]['enabled'] = true
  node.default['yum'][repo]['managed'] = true
end

include_recipe 'yum-fedora::default'
