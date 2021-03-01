# yum-fedora Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/yum-fedora.svg)](https://supermarket.chef.io/cookbooks/yum-fedora)
[![CI State](https://github.com/sous-chefs/yum-fedora/workflows/ci/badge.svg)](https://github.com/sous-chefs/yum-fedora/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

The yum-fedora cookbook takes over management of the default repositoryids that ship with Fedora systems. It allows attribute manipulation of `fedora`, `fedora-debuginfo`, `fedora-source`, `updates`, `updates-debuginfo`, `updates-source`, `updates-testing`, `updates-testing-debuginfo`, and `updates-testing-source`

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit sous-chefs.org or come chat with us on the Chef Community Slack in #sous-chefs.

## Requirements

### Platforms

- Fedora

### Chef

- Chef 12.14+

### Cookbooks

- none

## Attributes

The following attributes are set by default

```ruby
default['yum']['fedora']['repositoryid'] = 'fedora'
default['yum']['fedora']['description'] = 'Fedora $releasever - $basearch'
default['yum']['fedora']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch'
default['yum']['fedora']['enabled'] = true
default['yum']['fedora']['managed'] = true
default['yum']['fedora']['metadata_expire'] = '7d'
default['yum']['fedora']['gpgcheck'] = true
default['yum']['fedora']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
```

```ruby
default['yum']['fedora-debuginfo']['repositoryid'] = 'fedora-debuginfo'
default['yum']['fedora-debuginfo']['description'] = 'Fedora $releasever - $basearch - Debug'
default['yum']['fedora-debuginfo']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=fedora-debug-$releasever&arch=$basearch'
default['yum']['fedora-debuginfo']['enabled'] = false
default['yum']['fedora-debuginfo']['managed'] = false
default['yum']['fedora-debuginfo']['metadata_expire'] = '7d'
default['yum']['fedora-debuginfo']['gpgcheck'] = true
default['yum']['fedora-debuginfo']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
```

```ruby
default['yum']['fedora-source']['repositoryid'] = 'fedora-source'
default['yum']['fedora-source']['description'] = 'Fedora $releasever - Source'
default['yum']['fedora-source']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=$basearch'
default['yum']['fedora-source']['enabled'] = false
default['yum']['fedora-source']['managed'] = false
default['yum']['fedora-source']['metadata_expire'] = '7d'
default['yum']['fedora-source']['gpgcheck'] = true
default['yum']['fedora-source']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
```

```ruby
default['yum']['updates']['repositoryid'] = 'updates'
default['yum']['updates']['description'] = 'Fedora $releasever - $basearch - Updates'
default['yum']['updates']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch'
default['yum']['updates']['enabled'] = true
default['yum']['updates']['managed'] = true
default['yum']['updates']['gpgcheck'] = true
default['yum']['updates']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
```

```ruby
default['yum']['updates-debuginfo']['repositoryid'] = 'updates-debuginfo'
default['yum']['updates-debuginfo']['description'] = 'Fedora $releasever - $basearch - Updates - Debug'
default['yum']['updates-debuginfo']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-debug-f$releasever&arch=$basearch'
default['yum']['updates-debuginfo']['enabled'] = false
default['yum']['updates-debuginfo']['managed'] = false
default['yum']['updates-debuginfo']['gpgcheck'] = true
default['yum']['updates-debuginfo']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
```

```ruby
default['yum']['updates-source']['repositoryid'] = 'updates-source'
default['yum']['updates-source']['description'] = 'Fedora $releasever - Updates Source'
default['yum']['updates-source']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-released-source-f$releasever&arch=$basearch'
default['yum']['updates-source']['enabled'] = true
default['yum']['updates-source']['gpgcheck'] = true
default['yum']['updates-source']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
```

```ruby
default['yum']['updates-testing']['repositoryid'] = 'updates-testing'
default['yum']['updates-testing']['description'] = 'Fedora $releasever - $basearch - Test Updates'
default['yum']['updates-testing']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-f$releasever&arch=$basearch'
default['yum']['updates-testing']['enabled'] = false
default['yum']['updates-testing']['managed'] = false
default['yum']['updates-testing']['gpgcheck'] = true
default['yum']['updates-testing']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
```

```ruby
default['yum']['updates-testing-debuginfo']['repositoryid'] = 'updates-testing-debuginfo'
default['yum']['updates-testing-debuginfo']['description'] = 'Fedora $releasever - $basearch - Test Updates Debug'
default['yum']['updates-testing-debuginfo']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-debug-f$releasever&arch=$basearch'
default['yum']['updates-testing-debuginfo']['enabled'] = false
default['yum']['updates-testing-debuginfo']['managed'] = false
default['yum']['updates-testing-debuginfo']['gpgcheck'] = true
default['yum']['updates-testing-debuginfo']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
```

```ruby
default['yum']['updates-testing-source']['repositoryid'] = 'updates-testing-source'
default['yum']['updates-testing-source']['description'] = 'Fedora $releasever - Test Updates Source'
default['yum']['updates-testing-source']['mirrorlist'] = 'https://mirrors.fedoraproject.org/metalink?repo=updates-testing-source-f$releasever&arch=$basearch'
default['yum']['updates-testing-source']['enabled'] = false
default['yum']['updates-testing-source']['managed'] = false
default['yum']['updates-testing-source']['gpgcheck'] = true
default['yum']['updates-testing-source']['gpgkey'] = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
```

## Recipes

- default - Walks through node attributes and feeds a yum_resource
- parameters. The following is an example a resource generated by the
- recipe during compilation.

```ruby
  yum_repository 'fedora' do
    mirrorlist 'https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch'
    description 'Fedora $releasever - $basearch'
    enabled true
    gpgcheck true
    gpgkey 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch'
  end
```

## Usage Example

To disable the Fedora Updates repository through a Role or Environment definition

```ruby
default_attributes(
  :yum => {
    :updates => {
      :enabled => {
        false
       }
     }
   }
 )
```

Uncommonly used repositoryids are not managed by default. This is speeds up integration testing pipelines by avoiding yum-cache builds that nobody cares about. To enable the Fedora Debuginfo repository with a wrapper cookbook, place the following in a recipe:

```ruby
node.default['yum']['fedora-debuginfo']['managed'] = true
node.default['yum']['fedora-debuginfo']['enabled'] = true
include_recipe 'yum-fedora'
```

## More Examples

Point the fedora and updates repositories at an internally hosted server.

```ruby
node.default['yum']['fedora']['enabled'] = true
node.default['yum']['fedora']['mirrorlist'] = nil
node.default['yum']['fedora']['baseurl'] = 'https://internal.example.com/fedora/19/os/x86_64'
node.default['yum']['fedora']['sslverify'] = false
node.default['yum']['updates']['enabled'] = true
node.default['yum']['updates']['mirrorlist'] = nil
node.default['yum']['updates']['baseurl'] = 'https://internal.example.com/fedora/19/updates/x86_64'
node.default['yum']['updates']['sslverify'] = false

include_recipe 'yum-fedora'
```

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
