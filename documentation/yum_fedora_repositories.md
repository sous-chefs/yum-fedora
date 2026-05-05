# yum_fedora_repositories

Manages the standard Fedora repository set and removes stock Fedora repo files that conflict with
cookbook-managed repository files.

## Actions

| Action    | Description                                 |
|-----------|---------------------------------------------|
| `:create` | Deletes stock repo files and creates repos  |
| `:remove` | Removes all Fedora repository definitions   |

## Properties

| Property               | Type        | Default | Description                                      |
|------------------------|-------------|---------|--------------------------------------------------|
| `manage_debuginfo`     | true, false | `false` | Manage all `*-debuginfo` repositories            |
| `manage_source`        | true, false | `false` | Manage all `*-source` repositories               |
| `manage_testing`       | true, false | `false` | Manage all `updates-testing*` repositories       |
| `enable_debuginfo`     | true, false | `false` | Enable all `*-debuginfo` repositories            |
| `enable_source`        | true, false | `false` | Enable all `*-source` repositories               |
| `enable_testing`       | true, false | `false` | Enable all `updates-testing*` repositories       |
| `managed_repositories` | Array       | `[]`    | Additional repository ids to manage              |
| `enabled_repositories` | Array       | `[]`    | Additional repository ids to enable              |

## Examples

### Default repositories

```ruby
yum_fedora_repositories 'default'
```

### Manage and enable every Fedora repository

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

### Enable selected optional repositories

```ruby
yum_fedora_repositories 'selected' do
  managed_repositories %w(fedora-source updates-testing)
  enabled_repositories %w(fedora-source updates-testing)
end
```
