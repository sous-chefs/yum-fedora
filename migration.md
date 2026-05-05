# Migration Guide

## From Recipes and Attributes to Resources

This release removes the legacy `yum-fedora::default` recipe and all
`node['yum'][repo]` attributes. Use custom resources directly from your own cookbook recipes.

### Before

```ruby
node.default['yum']['updates-testing']['managed'] = true
node.default['yum']['updates-testing']['enabled'] = true

include_recipe 'yum-fedora'
```

### After

```ruby
yum_fedora_repository 'updates-testing' do
  managed true
  enabled true
end
```

### Managing the Default Repository Set

The default behavior from the old recipe is now:

```ruby
yum_fedora_repositories 'default'
```

This removes the stock Fedora updates repo files and manages only `fedora` and `updates` by
default. Debug, source, and testing repositories remain unmanaged and disabled unless enabled with
properties.

### Enabling All Repositories

```ruby
yum_fedora_repositories 'all' do
  manage_debuginfo true
  manage_source true
  manage_testing true
  enable_debuginfo true
  enable_source true
  enable_testing true
end
```

### Test Cookbook Examples

Executable examples live under `test/cookbooks/test/recipes/`:

* `default.rb` exercises the default repository set.
* `enable_all.rb` exercises every public Fedora repository id.
