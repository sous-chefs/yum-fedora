# Limitations

## Package Availability

### DNF/YUM (Fedora)

This cookbook manages the Fedora repositories that ship with Fedora systems. It does not install
third-party packages or compiled software.

Fedora currently publishes repositories through MirrorManager metalinks such as:

* `https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch`
* `https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch`
* `https://mirrors.fedoraproject.org/metalink?repo=updates-testing-f$releasever&arch=$basearch`

Fedora repository metadata is available for Fedora-supported architectures through the release
repositories. The cookbook preserves the upstream `$releasever` and `$basearch` substitutions so
Fedora resolves the correct release and architecture at runtime.

## Architecture Limitations

The cookbook does not hard-code an architecture. Fedora's `$basearch` variable is preserved in all
default metalinks and GPG key paths.

## Source/Compiled Installation

No source or compiled installation path is used. This cookbook only manages `.repo` configuration
through Chef Infra's built-in `yum_repository` resource.

## Platform Support

The cookbook supports Fedora only. Fedora Linux 44 was released on April 28, 2026, Fedora 43 remains
supported, and Fedora 42 reaches end of life in May 2026. Kitchen uses `fedora-latest` so CI tracks
the currently published Dokken Fedora image without pinning an EOL Fedora release.

## Known Issues

* The cookbook intentionally removes `/etc/yum.repos.d/fedora-updates.repo` and
  `/etc/yum.repos.d/fedora-updates-testing.repo` before managing repositories, preserving the legacy
  behavior of taking over stock Fedora repo file management.
* Optional debug, source, and testing repositories remain unmanaged and disabled by default. Enable
  them with resource properties when required.
