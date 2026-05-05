# yum_fedora_repository

Manages one Fedora Yum repository by wrapping Chef Infra's `yum_repository` resource.

## Actions

| Action    | Description                                   |
|-----------|-----------------------------------------------|
| `:create` | Creates the repository when `managed` is true |
| `:remove` | Removes the repository                        |

## Properties

| Property                | Type                 | Default        | Description                              |
|-------------------------|----------------------|----------------|------------------------------------------|
| `repositoryid`          | String               | name property  | Fedora repository id                     |
| `managed`               | true, false          | repo default   | Whether the repository should be managed |
| `description`           | String               | repo default   | Repository description                   |
| `mirrorlist`            | String, nil          | repo default   | Fedora MirrorManager metalink            |
| `baseurl`               | String, Array        | `nil`          | Direct repository URL                    |
| `enabled`               | true, false          | repo default   | Whether the repository is enabled        |
| `gpgcheck`              | true, false          | `true`         | Enables GPG package validation           |
| `gpgkey`                | String, Array        | Fedora key URL | GPG key URL                              |
| `metadata_expire`       | String               | repo default   | Metadata expiration setting              |
| `cost`                  | Integer, String      | `nil`          | Yum repository cost                      |
| `enablegroups`          | true, false          | `nil`          | Yum group support                        |
| `exclude`               | String, Array        | `nil`          | Excluded packages                        |
| `failovermethod`        | String               | `nil`          | Failover method                          |
| `fastestmirror_enabled` | true, false          | `nil`          | Fastest mirror plugin setting            |
| `http_caching`          | String               | `nil`          | HTTP cache policy                        |
| `include_config`        | String               | `nil`          | Include another Yum config file          |
| `includepkgs`           | String, Array        | `nil`          | Included packages                        |
| `keepalive`             | true, false          | `nil`          | HTTP keepalive setting                   |
| `max_retries`           | Integer, String      | `nil`          | Maximum retries                          |
| `mirror_expire`         | Integer, String      | `nil`          | Mirror expiration setting                |
| `mirrorlist_expire`     | Integer, String      | `nil`          | Mirrorlist expiration setting            |
| `password`              | String               | `nil`          | Repository password                      |
| `priority`              | Integer, String      | `nil`          | Repository priority                      |
| `proxy`                 | String               | `nil`          | Proxy URL                                |
| `proxy_username`        | String               | `nil`          | Proxy username                           |
| `proxy_password`        | String               | `nil`          | Proxy password                           |
| `report_instanceid`     | true, false          | `nil`          | Report cloud instance id                 |
| `skip_if_unavailable`   | true, false          | `nil`          | Skip unavailable repo                    |
| `source`                | String               | `nil`          | Source path                              |
| `sslcacert`             | String               | `nil`          | SSL CA certificate path                  |
| `sslclientcert`         | String               | `nil`          | SSL client certificate path              |
| `sslclientkey`          | String               | `nil`          | SSL client key path                      |
| `sslverify`             | true, false          | `nil`          | Enables SSL verification                 |
| `timeout`               | Integer, String      | `nil`          | Repository timeout                       |
| `username`              | String               | `nil`          | Repository username                      |

## Examples

### Default repository

```ruby
yum_fedora_repository 'fedora'
```

### Enable an optional repository

```ruby
yum_fedora_repository 'updates-testing' do
  managed true
  enabled true
end
```

### Use an internal mirror

```ruby
yum_fedora_repository 'updates' do
  baseurl 'https://internal.example.com/fedora/$releasever/updates/$basearch'
  mirrorlist nil
  sslverify false
end
```
